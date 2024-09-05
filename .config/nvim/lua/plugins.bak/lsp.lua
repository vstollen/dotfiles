local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'lua_ls', 'eslint', 'tsserver', 'rust_analyzer'},
  handlers = {
    lsp_zero.default_setup,
		lua_ls = function()
			require('lspconfig').lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = {'vim'}
						},
					},
				},
			})
		end,

		ltex = function()
			require('lspconfig').ltex.setup({
				settings = {
					ltex = {
						additionalRules = {
							enablePickyRules = true,
							motherTongue = 'de-DE',
							languageModel = '~/LanguageTool/'
						},
						enabled = {"bibtex", "context", "context.tex", "html", "latex", "markdown", "mdx", "org", "restructuredtext", "rsweave"},
					},
				},
				filetypes = {"bibtex", "context", "context.tex", "html", "latex", "markdown", "mdx", "org", "restructuredtext", "rsweave"},
				on_attach = function(client, bufnr)
					require('ltex_extra').setup()
				end,
			})
		end,
  },
})
