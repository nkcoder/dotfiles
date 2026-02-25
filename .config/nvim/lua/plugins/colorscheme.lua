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
      flavour = "auto", -- latte, frappe, macchiato, mocha
    },
  },

  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, name = "gruvbox" },

  -- Configure LazyVim to load your colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "github_dark",
      -- colorscheme = "tokyonight",
      -- colorscheme = "gruvbox",
      colorscheme = "catppuccin",
    },
  },
}
