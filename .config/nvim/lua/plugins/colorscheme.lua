return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 1000,
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  -- Configure LazyVim to load your colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight",
      colorscheme = "catppuccin",
    },
  },
}
