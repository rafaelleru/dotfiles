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

"syntax on

set colorcolumn=110

let mapleader = "\<Space>"
let maplocalleader = "\,"

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
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

Plugin 'preservim/nerdcommenter'
filetype plugin on

Plugin 'tpope/vim-fugitive'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"" TODO: Redefine this mappings
""let g:UltiSnipsListSnippets=""
let g:UltiSnipsExpandTrigger="<C-t>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"


Plugin 'luochen1990/indent-detector.vim'

Plugin 'neovim/nvim-lspconfig'
Plugin 'nvim-lua/completion-nvim'
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_trigger_on_delete = 1

" Use nvim as editor in browser
" TODO: revisit this
Plugin 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plugin 'jremmen/vim-ripgrep'
let g:rg_command = "rg --vimgrep -S"

Plugin 'tpope/vim-sleuth' 
Plugin 'cespare/vim-toml'
Plugin 'Yggdroot/indentLine'
Plugin 'junegunn/goyo.vim'
Plugin 'blueyed/vim-diminactive'
let g:diminactive_use_colorcolumn = 0
let g:diminactive_use_syntax = 1

Plugin 'tpope/vim-rhubarb'
Plugin 'tommcdo/vim-fubitive'

call vundle#end()            " required

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_transparent_bg=2
let g:gruvbox_material_transparent_background=1
set background=dark    " Setting dark mode
colorscheme gruvbox-material

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

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

let g:the_primeagen_qf_l = 0
let g:the_primeagen_qf_g = 0

fun! ToggleQFList(global)
    if a:global
        if g:the_primeagen_qf_g == 1
            let g:the_primeagen_qf_g = 0
            cclose
        else
            let g:the_primeagen_qf_g = 1
            copen
        end
    else
        if g:the_primeagen_qf_l == 1
            let g:the_primeagen_qf_l = 0
            lclose
        else
            let g:the_primeagen_qf_l = 1
            lopen
        end
    endif
endfun

command! MakeTags !ctags -R .

let $FZF_DEFAULT_COMMAND = 'rg -i --ignore-file ./.gitignore  --files'
