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

	use {
		'nvim-telescope/telescope-bibtex.nvim',
		requires = {
			{'nvim-telescope/telescope.nvim'},
		},
		config = function ()
		  require('telescope').load_extension('bibtex')
		end,
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		},
		config = "require('plugins.lsp')"
	}

	use {
		'stevearc/conform.nvim',
		config = "require('plugins.conform')"
	}

	use {
		'mbbill/undotree'
	}

	use("christoomey/vim-tmux-navigator")
	use {
		"github/copilot.vim",
		config = "require('plugins.copilot')"
	}

	use {
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		config = "require('plugins.nvim-tree')"
	}

	use {
		"lervag/vimtex",
		setup = "require('plugins.vimtex.setup')",
	}

	use("barreiroleo/ltex-extra.nvim")

	if packer_bootstrap then
		require('packer').sync()
	end
end)
