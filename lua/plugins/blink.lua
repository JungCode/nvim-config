return {
  "saghen/blink.cmp",
  build = "cargo build --release",
  opts = {
    completion = {
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      ghost_text = { enabled = false }, -- Disable ghost text

      list = {
        selection = {
          preselect = false, -- Don't select the first item automatically
          auto_insert = false, -- DON'T insert the text as you cycle through
        },
      },

      menu = {
        border = "rounded", -- Adds a border to the main menu
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      },

      documentation = {
        window = {
          border = "rounded", -- Adds a border to the documentation popup
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
