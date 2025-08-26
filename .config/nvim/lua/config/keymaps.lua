-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Find files including hidden/ignored files
vim.keymap.set("n", "<leader>fH", function()
  Snacks.picker.files({
    hidden = true,
    no_ignore = true,
  })
end, { desc = "Find files (including hidden/ignored)" })

-- Toggle Claude Code
vim.keymap.set("n", "<leader>ct", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" })
