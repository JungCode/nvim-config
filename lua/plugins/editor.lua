return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      {
        "sf",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
    },
    opts = function(_, opts)
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = { n = {} },
      })
      opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = { preview_cutoff = 9999 },
        },
      })
      opts.extensions = vim.tbl_deep_extend("force", opts.extensions or {}, {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            ["n"] = {
              ["N"] = function(prompt_bufnr)
                require("telescope").extensions.file_browser.actions.create(prompt_bufnr)
              end,
              ["h"] = function(prompt_bufnr)
                require("telescope").extensions.file_browser.actions.goto_parent_dir(prompt_bufnr)
              end,
              ["l"] = function(prompt_bufnr)
                require("telescope.actions").select_default(prompt_bufnr)
              end,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  require("telescope.actions").move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  require("telescope.actions").move_selection_next(prompt_bufnr)
                end
              end,
              ["<PageUp>"] = function(prompt_bufnr)
                require("telescope.actions").preview_scrolling_up(prompt_bufnr)
              end,
              ["<PageDown>"] = function(prompt_bufnr)
                require("telescope.actions").preview_scrolling_down(prompt_bufnr)
              end,
            },
          },
        },
      })
      return opts
    end,
  },
}
