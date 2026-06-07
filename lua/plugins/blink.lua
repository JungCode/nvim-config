return {
  "saghen/blink.cmp",
  build = "cargo build --release",
  opts = {
    completion = {
      ghost_text = { enabled = false }, -- Disable ghost text

      list = {
        selection = {
          preselect = false, -- Don't select the first item automatically
          auto_insert = false, -- DON'T insert the text as you cycle through
        },
      },

      menu = {
        border = "rounded",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      },

      documentation = {
        window = {
          border = "rounded",
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        },
      },
    },

    keymap = {
      preset = "default",
      ["<CR>"] = { "accept", "fallback" },
    },
  },
}
