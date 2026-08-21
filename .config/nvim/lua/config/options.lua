-- disable newtrw at the very start of you init.lua
vim.g.loaded_newtrw = 0
vim.g.loaded_netrwPlugin = 0

vim.opt.number = true
vim.wo.cursorline = true
-- Display tabs and trailing spaces
vim.opt.list = true
vim.opt.listchars = { tab = ">-", trail = "-" }

-- Search Config
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

vim.opt.scrolloff = 15
vim.opt.sidescrolloff = 10
vim.opt.startofline = false

vim.opt.conceallevel = 2

vim.wo.wrap = false

-- Tab related options
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.clipboard = "unnamedplus"

