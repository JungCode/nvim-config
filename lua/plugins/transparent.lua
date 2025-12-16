return {
  "xiyaowong/transparent.nvim",
  config = function()
    require("transparent").setup({
      enable = true,
      extra_groups = {
        "Normal",
        "NormalFloat",
        "FloatBorder",
        "TelescopeNormal",
        "TelescopePromptNormal",
        "TelescopeResultsNormal",
        "TelescopePreviewNormal",
      },
    })
  end,
}
