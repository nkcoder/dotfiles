return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    direction = "float",
    float_opts = {
      border = "curved",
      winblend = 3,
      width = math.floor(vim.o.columns * 0.8),
      height = math.floor(vim.o.lines * 0.7),
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Exit terminal mode with eSC
    vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>:close<CR>]], { noremap = true })

    -- ESC in normal mode (inside terminal buffer) → close
    -- vim.api.nvim_create_autocmd("TermOpen", {
    --   pattern = "*",
    --   callback = function()
    --     vim.keymap.set("n", "<Esc>", ":close<CR>", { noremap = true, buffer = true, silent = true })
    --     vim.cmd("startinsert") -- auto enter insert mode when terminal opens
    --     vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25-Cursor,r-cr:hor20,o:hor50" -- thin beam cursor for insert mode
    --   end,
    -- })
  end,
}
