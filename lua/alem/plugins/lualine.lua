return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local gruvbox_dark = require("alem.plugins.themes.gruvbox_dark")
    --local codedark = require("alem.plugins.themes.codedark")

    require("lualine").setup({
      options = {
        theme = gruvbox_dark,
      },
    })
  end,
}
