return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        opts = {
          registries = {
            "github:nvim-java/mason-registry",
          },
          ensure_installed = {
            "clang-format",
            "codelldb",
            "stylua",
            "prettierd",
          },
        },
      })
    end,
  },
  {

    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "ts_ls",
          "unocss",
          "gopls",
          "clangd",
        },
        --automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    config = function()
      local pid = vim.fn.getpid()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      local util = require("lspconfig/util")
      -- LSPs
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.unocss.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      })
      lspconfig.jdtls.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
      })
      -- TOML lsp
      lspconfig.taplo.setup({
        capabilities = capabilities,
      })

      lspconfig.omnisharp.setup({
        capabilities = capabilities,
        cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
        on_attach = function(bufnr)
          if bufnr == 0 then
            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
          end
        end,
        enable_import_completion = true,
        organize_imports_on_format = true,
        enable_roslyn_analyzers = true,
        handlers = {
          ["textDocument/definition"] = function(...)
            return require("omnisharp_extended").handler(...)
          end,
        },
        keys = {

          "gd",
          function()
            require("omnisharp_extended").telescope_lsp_definitions()
          end,
          desc = "Goto Definition",
        },
        -- root_dir = function()
        --   return vim.loop.cwd() -- current working directory
        -- end,
      })
      -- Keybinds
      vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
      end, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>co", vim.lsp.buf.code_action, {})
    end,
  },
}
