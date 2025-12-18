return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependecies = {
    "windwp/nvim-ts-autotag",
  },
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
        "bash",
        "dockerfile",
        "gitignore",
      },
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        }
      }
    })
  end,
}

