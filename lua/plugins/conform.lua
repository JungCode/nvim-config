return {
  {
    "stevearc/conform.nvim",
    format_on_save = {
      timeout_ms = 8000, -- tăng timeout (fix eslint_d bị chậm)
    },
    opts = {
      -- Quy định formatter cho từng filetype
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },

        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
      },
    },
  },
}
