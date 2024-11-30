-- Options
vim.o.termguicolors = true

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.o.undofile = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.termguicolors = true

vim.opt.scrolloff = 8
vim.o.signcolumn = "yes"

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.colorcolumn = "100"

vim.o.exrc = true

-- Mappings
vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "gl", vim.diagnostic.open_float)

-- Plugin
require('config.lazy')
