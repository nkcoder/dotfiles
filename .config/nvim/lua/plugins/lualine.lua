return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      lualine_c = {
        {
          "filename",
          path = 1, -- show relative path
          shorting_target = 0, -- no shortening
        },
      },
    },
  },
}
