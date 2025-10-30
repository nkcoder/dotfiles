return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      json = { "jq" },
      go = { "goimports", "gofmt" },
      rust = { "rustfmt" },
      lua = { "stylua" },
    },
    format_on_save = {
      timeout_ms = 500,
    },
  },
}
