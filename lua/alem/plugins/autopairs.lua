return {
  "windwp/nvim-autopairs",
  event = {"InsertEnter"},
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
      -- Import nvim-autopairs
      local autopairs = require("nvim-autopairs")

    -- Configuring autopairs
    autopairs.setup({
      check_ts = true, -- enable tresitter
      ts_config = {
        lua = {"string" }, -- dont add pairs in lua strings
        javascript = {"template_string"}, -- dont add pairs in javascript template_string tresitter nodes
        java = false, -- dont check tresitter on java
      }
    })

    -- nvim-autopairs completion funcionality
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- Import nvim-cmp plugin
    local cmp = require("cmp")

    -- Make autopairs and autocompletion work together
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end
}
