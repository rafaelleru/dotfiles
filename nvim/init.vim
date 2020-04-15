set number
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
set clipboard=unnamed
set termguicolors

let mapleader = "\<Space>"

set nocompatible              " required
filetype off                  " required

set rtp+=~/.config/nvim/bundle/Vundle.vim
set rtp+=~/.vim/bundle
set rtp+=~/.fzf

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'shawncplus/phpcomplete.vim'
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
call vundle#end()            " required

colorscheme NeoSolarized

filetype plugin indent on    " required

au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let python_highlight_all=1
syntax on


let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>ff :FZF~<CR>

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

let g:CtrlSpaceDefaultMappingKey = "<C-space> "
" let g:CtrlSpaceFileEngine = s:vimfiles . '/plugged/vim-ctrlspace' . '/bin/file_engine_' . s:os . '_amd64'
"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

let g:vdebug_options = {
      \ 'port' : 9002,
      \ 'server' : '',
      \ 'path_maps': {
        \ '/var/www/html/ws-api': '/home/rl/projects/ws-api'
      \ }
      \ }
 let g:vdebug_features = { 'max_children': 128 }

let g:phpcomplete_mappings = {
  \ 'jump_to_def': ',g',
  \ 'jump_to_def_tabnew': ',t',
  \ }
