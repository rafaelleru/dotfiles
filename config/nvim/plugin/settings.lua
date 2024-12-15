-- settings.lua

-- Configurar opciones
vim.opt.colorcolumn = "110"

-- Función para configurar opciones de Neovim
local set = vim.opt

-- Configuraciones básicas
set.number = true
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

-- Ignorar archivos en NERDTree
vim.g.NERDTreeIgnore = { '\\.pyc$', '\\~$' }

-- Configuración de rg para vimgrep
vim.g.rg_command = "rg --vimgrep -S"

-- Colores verdaderos
if vim.fn.exists('+termguicolors') then
    vim.opt.termguicolors = true
end

vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_transparent_bg = 2
vim.g.gruvbox_material_transparent_background = 1
vim.opt.background = "dark"
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

-- Tema
require("catppuccin").setup({
    flavor = 'macchiato'
})
vim.cmd("syntax enable")
vim.cmd("colorscheme catppuccin")

-- Configuración de colores
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")
vim.cmd("hi Comment gui=italic cterm=italic")

-- Configuración de grepper
-- vim.g.grepper = {}
-- vim.g.grepper.tools = { 'rg', 'git' }

-- Configuración de indentLine
vim.g.indentLine_conceallevel = 0

-- Configuración de Treesitter para folding
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"

-- Autor de snippets
vim.g.snips_author = 'Rafael Leyva'

-- Formatos de archivo
set.fileformats = { 'unix' }
