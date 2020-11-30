set number relativenumber
set showmode
set showcmd
set wildmenu
set ruler
set hidden
set autoindent
set hlsearch
set showmatch
set ignorecase
set encoding=utf-8
set showtabline=0
set clipboard=unnamedplus
set termguicolors

let mapleader = "\<Space>"

set nocompatible              " required
filetype off                  " required

set rtp+=~/.config/nvim/bundle/Vundle.vim
set rtp+=~/.vim/bundle
set rtp+=~/.fzf

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'dense-analysis/ale'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-vdebug/vdebug'
Plugin 'preservim/nerdcommenter'
Plugin 'lifepillar/vim-solarized8'
Plugin 'iCyMind/NeoSolarized'
Plugin 'junegunn/fzf'
Plugin 'airblade/vim-gitgutter'
Plugin 'airblade/vim-fugitive'
" Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'alfredodeza/jacinto.vim'
Plugin 'vimoxide/vim-cinnabar'
Plugin 'luochen1990/indent-detector.vim'
Plugin 'lervag/vimtex'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
call vundle#end()            " required

colorscheme solarized8
"let g:neosolarized_termtrans=1
filetype plugin indent on    " required

au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let python_highlight_all=1
syntax on

"Get the 2-space YAML as the default when hit carriage return after the colon
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g <Plug>(coc-definition)
map <leader>ff :FZF~<CR>
map <leader>n :NERDTreeToggle<CR> 

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

let g:vdebug_options = {
      \ 'port' : 9002,
      \ 'server' : '',
      \ 'path_maps': {
        \ '/var/www/html/ws-api': '/home/rl/projects/ws-api'
      \ }
      \ }
let g:vdebug_features = { 'max_children': 128 }

let g:ymc_language_server =
  \ [ 
  \   {
  \     'name': 'php',
  \     'cmdline': [ 'intelephense', '--stdio' ],
  \     'filetypes': [ 'php' ],
  \     'project_root_files': [ '.git', 'compose.json' ]
  \   }
  \ ]

" statusline
set statusline=
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#CursorLineNr#
set statusline+=\ %F
set statusline+=\ %M
set statusline+=%= "Right side settings
set statusline+=%#Search#
set statusline+=\ %c:%l/%L
set statusline+=\ [%p%%]

" Keeps track of all changes done, this way if I can recover changes even in
" a closed file
"
set undofile
set undodir=$HOME/.local/vim_undo_dir

" LaTeX flavor
let g:tex_flavor = 'latex'
