local function setupMason()
  require("mason").setup({})
  require("mason-lspconfig").setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = {"lua_ls", "eslint", "ts_ls", "rust_analyzer"},
    handlers = {
      function(server_name)
        require("lspconfig")[server_name].setup({})
      end,
      lua_ls = function()
        require("lspconfig").lua_ls.setup({
          settings = {
            Lua = {
              diagnostics = {
                globals = {"vim"}
              },
            },
          },
        })
      end,
      ltex = function()
        require("lspconfig").ltex.setup({
          settings = {
            ltex = {
              additionalRules = {
                enablePickyRules = true,
                motherTongue = "de-DE",
                languageModel = "~/LanguageTool/"
              },
              enabled = { "bibtext", "context", "context.tex", "html", "latex", "markdown", "mdx", "org", "restructuredtext", "rsweave" },
            },
          },
          filetypes = { "bibtext", "context", "context.tex", "html", "latex", "markdown", "mdx", "org", "restructuredtext", "rsweave" },
          on_attach = function(client, bufnr)
            require("ltex_extra").setup()
          end,
        })
      end,
      clangd = function()
        require("lspconfig").clangd.setup({
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }
        })
      end
    },
  })
end

local function setupCmp()
  local cmp = require("cmp")

  cmp.setup({
    sources = {
      { name = "nvim_lsp" },
    },
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({}),
  })
end

return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local lsp_zero = require("lsp-zero")

      -- lsp_attach is where you enable features that only work
      -- if there is a language server active in the file
      local lsp_attach = function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
      end

      lsp_zero.extend_lspconfig({
        sign_text = true,
        lsp_attach = lsp_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      setupMason()
      setupCmp()
    end
  }
}

