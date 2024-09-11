vim.g.mapleader = " "
vim.opt.title = true
vim.opt.titlestring = vim.fn.expand("%:~")

vim.diagnostic.open_float()

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a" -- allow the mouse to be used in Nvim
vim.opt.splitright = true

vim.opt.scrolloff = 999
vim.opt.splitbelow = true
vim.opt.wrap = false

vim.opt.undofile = true
vim.opt.expandtab = true
vim.opt.tabstop = 10
vim.opt.shiftwidth = 10
vim.opt.cul = true

vim.opt.clipboard = "unnamedplus"

vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.termguicolors = true
