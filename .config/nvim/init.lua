-- Options
vim.o.termguicolors = true
vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.o.undofile = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = false
vim.o.signcolumn = "yes"
vim.o.number = true
vim.o.relativenumber = true

-- Mappings
vim.g.mapleader = ' '

vim.keymap.set('i', 'jk', '<ESC>')

-- Plugin
require('plugins')
