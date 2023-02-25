require('nvim-treesitter.configs').setup {
	ensure_installed = { "go", "lua", "help" },
	
	-- Install parsers synchronously
	sync_install = false,

	highlight = {
		enable = true
	},
}
