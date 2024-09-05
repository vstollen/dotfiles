require('nvim-treesitter.configs').setup {
	ensure_installed = { "typescript", "javascript", "tsx", "rust", "go", "lua", "help" },

	-- Install parsers synchronously
	sync_install = false,

	highlight = {
		enable = true,
		-- Latex is handled by vimtex
		disable = { "latex" }
	},
}

vim.treesitter.language.register("markdown", { "mdx" })
