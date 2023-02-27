-- Bootstrap lua
-- See: https://github.com/wbthomason/packer.nvim/tree/1d0cf98a561f7fd654c970c49f917d74fafe1530#bootstrapping
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Theme
	use {
		'catppuccin/nvim',
		as = 'catppuccin',
		config = "require('plugins.catppuccin')"
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
		config = "require('plugins.treesitter')"
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} },
		config = "require('plugins.telescope')"
	}

	use { 'neovim/nvim-lspconfig', config = "require('plugins.lspconfig')" }

	if packer_bootstrap then
		require('packer').sync()
	end
end)
