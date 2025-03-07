return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "heex",
        "javascript",
        "html",
        "css",
        "typescript",
        "go",
        "json",
        "java",
        "c",
        "cpp",
        "sql",
        "markdown",
        "c_sharp",
      },
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
