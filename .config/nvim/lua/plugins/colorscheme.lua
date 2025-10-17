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
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
    },
  },

  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
  },

  -- Configure LazyVim to load your colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "github_dark",
      -- colorscheme = "tokyonight",
      colorscheme = "catppuccin",
    },
  },
}
