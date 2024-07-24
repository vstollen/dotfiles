require("conform").setup({
	formatters_by_ft = {
		javascript = {
			{
				"prettier",
			}
		}
	}
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
