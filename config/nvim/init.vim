set number relativenumber
set wildmenu
set hidden
set nohlsearch
set showmatch
set encoding=utf-8
set clipboard=unnamedplus
set termguicolors
set undofile
set undodir=$HOME/.local/vim_undo_dir
set path+=**
set wildignore+=*.pyc,*~
set noswapfile
set list
set mouse=a
set cursorline
set foldlevelstart=1
set scrolloff=10
set nocompatible
set tabstop=4 "I prefer more small tabs when opening files

" Fix vim split default behavior
set splitright
set splitbelow

let mapleader = "\<Space>"
let maplocalleader = "\,"

"syntax on

set colorcolumn=110

set rtp+=~/.config/nvim/bundle/Vundle.vim
set rtp+=~/.vim/bundle
set rtp+=~/.fzf

call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
"Plug 'sainnhe/gruvbox-material'
"Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim'

Plug 'junegunn/fzf'

Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdcommenter'
filetype plugin on

Plug 'tpope/vim-fugitive'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


Plug 'luochen1990/indent-detector.vim'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-lua/completion-nvim'
"
" Use nvim as editor in browser
" TODO: revisit this
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plug 'mhinz/vim-grepper'

Plug 'tpope/vim-sleuth' 
Plug 'cespare/vim-toml'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/goyo.vim'
Plug 'blueyed/vim-diminactive'

Plug 'tpope/vim-rhubarb'
Plug 'tommcdo/vim-fubitive'

Plug 'tommcdo/vim-lion'

Plug 'romainl/vim-qf'

Plug 'nvim-treesitter/nvim-treesitter'

Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mhartington/oceanic-next'
Plug 'chriskempson/base16-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'wuelnerdotexe/vim-enfocado'
Plug 'pbrisbin/vim-mkdir'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'sbdchd/neoformat'
Plug 'unblevable/quick-scope' " highlight relevant characters in the current line to quickly jump to words using f,F,t,T
Plug 'caenrique/nvim-maximize-window-toggle' " Toggle the nvim current window to be maximized or not
Plug 'editorconfig/editorconfig-vim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'mfussenegger/nvim-dap'
Plug 'hrsh7th/nvim-compe'
Plug 'evansalter/vim-checklist'
call plug#end()            " required

" Python
lua require'lspconfig'.pylsp.setup{}
" PHP
lua require'lspconfig'.intelephense.setup{}
" Go
lua require'lspconfig'.gopls.setup{}
" C/C++
lua require'lspconfig'.clangd.setup{}
" Rust
lua require'lspconfig'.rust_analyzer.setup{}
" Vim language server
lua require'lspconfig'.vimls.setup{}
lua require'lspconfig'.metals.setup{}

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
    }
}
EOF

command! MakeTags !ctags -R .

let $FZF_DEFAULT_COMMAND = 'rg -i --ignore-file ./.gitignore  --files'
lua << EOF
require('telescope').load_extension('fzf')
EOF
