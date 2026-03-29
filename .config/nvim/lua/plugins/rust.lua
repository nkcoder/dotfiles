return {
  {
    "mrcjkb/rustaceanvim",
    version = "^8", -- Recommended
    opts = {
      server = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              command = "clippy", -- use clippy instead of check
            },
            procMacro = {
              enable = true,
            },
          },
        },
      },
    },
  },
}
