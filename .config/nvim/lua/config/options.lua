-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.spell = false
vim.opt.swapfile = false

-- text width and wrap
vim.opt.wrap = true
vim.opt.textwidth = 120
vim.opt.columns = 120
-- vim.opt.colorcolumn = "120"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.textwidth = 120
  end,
})
