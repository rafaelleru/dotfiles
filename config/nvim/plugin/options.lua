local set = vim.opt
set.relativenumber = true
set.wildmenu = true
set.hidden = true
set.hlsearch = false
set.showmatch = true
set.encoding = "utf-8"
set.clipboard = "unnamedplus"
set.termguicolors = true
set.undofile = true
set.undodir = vim.fn.expand("$HOME/.local/vim_undo_dir")
set.path:append("**")
set.wildignore:append("*.pyc,*~")
set.swapfile = false
set.list = true
set.mouse = "nv"
set.cursorline = true
set.foldlevelstart = 1
set.scrolloff = 10
set.compatible = false
set.tabstop = 4
set.exrc = true
set.splitright = true
set.splitbelow = true

require("catppuccin").setup({
    flavor = 'macchiato'
})
vim.cmd("syntax enable")
vim.cmd("colorscheme catppuccin")

vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")
vim.cmd("hi Comment gui=italic cterm=italic")
