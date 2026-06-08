return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
        },
        win = {
          input = {
            keys = {
              ["<Esc>"] = { "close", mode = { "n", "i" } },
            },
          },
        },
      },
    },
    init = function()
      -- 背景を強制的に透明にするためのハイライト設定
      local function transparent_snacks()
        local groups = {
          "SnacksNormal",
          "SnacksNormalNC",
          "SnacksPicker",
          "SnacksPickerBorder",
          "SnacksPickerList",
          "SnacksPickerListBorder",
          "SnacksPickerPreview",
          "SnacksPickerPreviewBorder",
          "SnacksPickerInput",
          "SnacksPickerInputBorder",
          "SnacksPickerTitle",
        }
        for _, group in ipairs(groups) do
          vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
        end
      end

      -- カラースキーム変更時と起動時に実行
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = transparent_snacks,
      })
      transparent_snacks()
    end,
  },
}
