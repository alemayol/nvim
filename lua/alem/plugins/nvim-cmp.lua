return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    {
      "L3MON4D3/LuaSnip",
      -- Follow latest release
      version = "v2.*", -- Replace <CurrentMajor> with the latest major release, i.e 2,3,4, etc
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- autocompletion 
    "rafamadriz/friendly-snippets",-- useful snippets
    --"onsails/lspkind.nvim", -- vscode like pictograms
  }, config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      --local lspkind = require("lspkind")
      
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect"
      },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
      },
		window = {
		  completion = cmp.config.window.bordered(),
		  documentation = cmp.config.window.bordered(),
	  },
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
			["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	  }),
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" }, -- For luasnip users.
            { name = "buffer" }, -- text within current buffer
            { name = "path"}, -- Filesystem paths
		})
    })
     end
}
