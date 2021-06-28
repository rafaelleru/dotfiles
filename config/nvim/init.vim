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
set completeopt=menuone,noinsert,noselect
set noswapfile
set list
set mouse=a

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

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'sainnhe/gruvbox-material'
Plugin 'morhetz/gruvbox'

Plugin 'junegunn/fzf'

Plugin 'junegunn/fzf.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'preservim/nerdcommenter'
filetype plugin on

Plugin 'tpope/vim-fugitive'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'


Plugin 'luochen1990/indent-detector.vim'

Plugin 'neovim/nvim-lspconfig'
Plugin 'nvim-lua/completion-nvim'
"
" Use nvim as editor in browser
" TODO: revisit this
Plugin 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plugin 'mhinz/vim-grepper'

Plugin 'tpope/vim-sleuth' 
Plugin 'cespare/vim-toml'
Plugin 'Yggdroot/indentLine'
Plugin 'junegunn/goyo.vim'
Plugin 'blueyed/vim-diminactive'

Plugin 'tpope/vim-rhubarb'
Plugin 'tommcdo/vim-fubitive'

Plugin 'tommcdo/vim-lion'

Plugin 'vim-scripts/a.vim'

call vundle#end()            " required

" Python
lua require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
" PHP
lua require'lspconfig'.intelephense.setup{ on_attach=require'completion'.on_attach }
" Go
lua require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }
" C/C++
lua require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }
" Rust
lua require'lspconfig'.rls.setup{ on_attach=require'completion'.on_attach }
" Vim language server
lua require'lspconfig'.vimls.setup{ on_attach=require'completion'.on_attach }

command! MakeTags !ctags -R .

let $FZF_DEFAULT_COMMAND = 'rg -i --ignore-file ./.gitignore  --files'
