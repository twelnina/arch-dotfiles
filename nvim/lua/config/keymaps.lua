-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>tt", function()
  Snacks.terminal.toggle(nil, {
    win = {
      position = "bottom",
      height = 0.2,
    },
  })
end, { desc = "Terminal (Bottom)" })

vim.keymap.set("n", "<leader>tg", function()
  Snacks.terminal.toggle("codex", {
    win = {
      position = "right",
      width = 0.3,
    },
  })
end, { desc = "Gemini CLI (Right)" })
