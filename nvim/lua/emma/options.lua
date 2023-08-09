PATH = "/Users/emmaeilefsen/.local/share/"
-- colorscheme
require('emma.base16')
vim.g.base16_background_transparent = 1
-- Enable mouse mode
vim.opt.mouse = 'a'
-- Enable system clipboard
vim.opt.clipboard = 'unnamedplus'
-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true
-- various GUI
vim.opt.termguicolors = true
vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.cursorlineopt = "screenline"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
-- line numbers
vim.opt.nu = true
vim.opt.rnu = true
-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- wrap
vim.opt.wrap = false
-- folding
vim.opt.foldmethod = 'marker'
vim.opt.foldenable = false
-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'
-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
-- tmp files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("XDG_STATE_HOME") .. "/nvim/undodir"
vim.opt.undofile = true
