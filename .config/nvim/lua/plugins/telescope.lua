local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

require('telescope').setup{
	defaults = {
		mappings = {
			i = {
				['<C-j>'] = actions.move_selection_next,
				['<C-k>'] = actions.move_selection_previous
			}
		}
	}
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
