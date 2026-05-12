vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.o.number = true
vim.o.mouse = 'a'

vim.o.showmode = false

vim.o.wrap = false
vim.o.breakindent = true
vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

vim.o.updatetime = 250

vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10

vim.o.confirm = true

-- Use spaces instead of tab characters
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4

-- vim.lsp.start {
--   name = 'biome-test',
--   cmd = { '/home/martijn/.local/share/nvim/mason/packages/biome/node_modules/@biomejs/biome/bin/biome', 'lsp-proxy' },
--   root_dir = vim.loop.cwd(),
--   filetypes = { 'javascript' },
-- }
