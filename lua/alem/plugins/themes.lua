return {
  "ellisonleao/gruvbox.nvim",
  name = "gruvbox",
  lazy = false,
  priority = 1000,
  opts = {
    terminal_colors = true,
    contrast = "soft",
  },
  config = function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("gruvbox")
  end,
}
