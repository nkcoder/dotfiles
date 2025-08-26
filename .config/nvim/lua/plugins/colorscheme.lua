return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 100,
  },

  -- Configure LazyVim to load your colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
      -- colorscheme = "catppuccin",
    },
  },
}
