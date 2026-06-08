-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

local kitty_margin_group = vim.api.nvim_create_augroup("KittyMargin", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
  group = kitty_margin_group,
  callback = function()
    os.execute("kitty @ set-spacing padding=0")
  end,
})

vim.api.nvim_create_autocmd("VimLeave", {
  group = kitty_margin_group,
  callback = function()
    os.execute("kitty @ set-spacing padding=15")
  end,
})

-- About Processing
-- Processing (.pde) 実行設定
local processing_group = vim.api.nvim_create_augroup("ProcessingConfig", { clear = true })
local processing_terminals = {}

local function start_processing_lsp(bufnr, sketch_dir)
  if #vim.lsp.get_clients({ bufnr = bufnr, name = "processing-lsp" }) > 0 then
    return
  end

  if vim.fn.executable("processing") ~= 1 then
    vim.notify("processing command not found; Processing LSP was not started", vim.log.levels.WARN)
    return
  end

  vim.lsp.start({
    name = "processing-lsp",
    cmd = { "processing", "lsp" },
    root_dir = sketch_dir,
    on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
  }, {
    bufnr = bufnr,
  })
end

local function restart_processing_lsp(bufnr, sketch_dir)
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr, name = "processing-lsp" })) do
    client:stop(true)
  end

  vim.defer_fn(function()
    if vim.api.nvim_buf_is_valid(bufnr) then
      start_processing_lsp(bufnr, sketch_dir)
    end
  end, 100)
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = processing_group,
  pattern = "*.pde",
  callback = function(args)
    -- ファイルタイプを設定
    vim.bo[args.buf].filetype = "processing"
    vim.bo[args.buf].syntax = "processing"

    local sketch_dir = vim.fn.fnamemodify(args.file, ":p:h")
    start_processing_lsp(args.buf, sketch_dir)

    vim.api.nvim_buf_create_user_command(args.buf, "ProcessingLspRestart", function()
      restart_processing_lsp(args.buf, sketch_dir)
    end, { desc = "Restart Processing LSP" })

    -- 実行コマンドの定義
    vim.api.nvim_buf_create_user_command(args.buf, "ProcessingRun", function()
      vim.cmd("write")

      if processing_terminals[sketch_dir] and processing_terminals[sketch_dir]:buf_valid() then
        processing_terminals[sketch_dir]:close()
      end

      processing_terminals[sketch_dir] = Snacks.terminal.open(
        { "processing", "cli", "--sketch=" .. sketch_dir, "--run" },
        {
          cwd = sketch_dir,
          auto_close = true,
          win = {
            position = "bottom",
            height = 0.2,
            width = 0.5,
          },
        }
      )
    end, { desc = "Run Processing sketch in terminal" })

    -- キーマップ設定: <leader>pr
    vim.keymap.set("n", "<leader>pr", "<cmd>ProcessingRun<CR>", {
      buffer = args.buf,
      desc = "Run Processing sketch",
    })
  end,
})
