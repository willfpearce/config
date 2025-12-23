-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set("n", "<leader>dl", function()
  vim.diagnostic.setqflist()
end, { desc = "List diagnostics" })
