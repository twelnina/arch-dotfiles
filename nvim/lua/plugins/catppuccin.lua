return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      show_end_of_buffer = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        telescope = true,
        treesitter = true,
        mason = true,
        notify = true,
        which_key = true,
      },
    },
  },
}
