return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = {
          hidden = true,
          ignored = false,
          follow = true,
        },
      },
    },
    terminal = {
      win = {
        style = "float",
        border = "rounded",
        width = 0.6,
        height = 0.7,
      },
    },
  },
  keys = {
    -- Normal mode: space + to open
    {
      "<leader>t",
      function()
        Snacks.terminal.toggle()
      end,
      desc = "Toggle Terminal",
    },
    -- Terminal mode: space + t to close/hide
    {
      "<leader>t",
      function()
        Snacks.terminal.toggle()
      end,
      desc = "Toggle Terminal",
      mode = "t",
    },
  },
}
