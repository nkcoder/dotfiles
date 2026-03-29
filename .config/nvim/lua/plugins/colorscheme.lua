-- List of your favorite themes
local themes = {
  "catppuccin",
  "tokyonight",
  "kanagawa",
  "gruvbox",
  "nightfox",
}

-- Seed the random generator
math.randomseed(os.time())
local picked_theme = themes[math.random(#themes)]

return {
  -- 1. Install all the theme plugins
  { "catppuccin/nvim", name = "catppuccin" },
  { "folke/tokyonight.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "EdenEast/nightfox.nvim" },

  -- 2. Tell LazyVim which one we picked for this session
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = picked_theme,
    },
  },
}
