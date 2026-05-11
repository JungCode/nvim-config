-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.diagnostic.config({
  float = {
    border = "rounded", -- Options: "single", "double", "shadow", "rounded"
    -- true: always shows the source (e.g., [lua_ls] or [pyright])
    -- "if_many": only shows the source if there are multiple LSPs
    source = true, -- Shows which LSP the error came from
  },
})
