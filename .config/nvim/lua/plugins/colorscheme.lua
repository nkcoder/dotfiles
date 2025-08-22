return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
  },

  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        colors = {
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors)
          return {}
        end,
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = {
          dark = "wave", -- try "dragon" !
          light = "lotus",
        },
      })
    end,
  },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false },

  -- Configure LazyVim to load your colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight",
      -- colorscheme = "kanagawa",
      colorscheme = "catppuccin",
    },
  },
}
