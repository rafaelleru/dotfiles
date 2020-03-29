set number
set hidden
set encoding=utf-8
set showtabline=0
set clipboard=unnamed

let mapleader = "\<Space>"

set nocompatible              " required
filetype off                  " required

set rtp+=~/.config/nvim/bundle/Vundle.vim
set rtp+=~/.fzf

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'dense-analysis/ale'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-vdebug/vdebug'
Plugin 'preservim/nerdcommenter'
Plugin 'lifepillar/vim-solarized8'
Plugin 'junegunn/fzf'
" Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}


call vundle#end()            " required
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

let g:vdebug_options = {
      \ 'port' : 9000,
      \ 'server' : '',
      \ 'path_maps': {
        \ '/var/www/html/ws-api': '${VCS_DIR}/ws-api'
      \ }
      \}


