-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local float_term = require("config.float_term")

vim.keymap.set("n", "<C-\\>", float_term.toggle, { desc = "Toggle floating terminal" })

-- Double Esc to exit terminal mode → normal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
