return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      servers = {
        gopls = {
          settings = {
            gopls = {
              usePlaceholders = false, -- Disable function parameter placeholders
            },
          },
        },

        ts_ls = {
          settings = {
            typescript = {
              preferences = {
                includeCompletionsWithSnippetText = false,
              },
            },
          },
        },
      },
    },
  },
}
