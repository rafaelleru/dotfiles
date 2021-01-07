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
set wildignore+=*.pyc
set completeopt=menuone,noinsert,noselect
set noswapfile
set list

syntax on 

set colorcolumn=110

let mapleader = "\<Space>"

set rtp+=~/.config/nvim/bundle/Vundle.vim
set rtp+=~/.vim/bundle
set rtp+=~/.fzf

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'morhetz/gruvbox'

Plugin 'junegunn/fzf'
nnoremap <c-p> :FZF<CR>

Plugin 'scrooloose/nerdtree'
nnoremap <leader>nt :NERDTreeToggleVCS<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

Plugin 'preservim/nerdcommenter'
filetype plugin on

Plugin 'tpope/vim-fugitive'
nnoremap <leader>gs :G<CR>

Plugin 'luochen1990/indent-detector.vim'

Plugin 'neovim/nvim-lspconfig'
Plugin 'nvim-lua/completion-nvim'
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" TODO: This looks messy
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" TODO: Redefine this mappings
"let g:UltiSnipsExpandTrigger=""
"let g:UltiSnipsListSnippets=""
"let g:UltiSnipsJumpForwardTrigger          <c-j>
"let g:UltiSnipsJumpBackwardTrigger         <c-k>

" Use nvim as editor in browser
" TODO: revisit this
Plugin 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plugin 'jremmen/vim-ripgrep'
let g:rg_command = "rg --vimgrep -S"

Plugin 'tpope/vim-sleuth' 
call vundle#end()            " required

colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set background=dark    " Setting dark mode

" statusline
set statusline=
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#CursorLineNr#
set statusline+=\ %F
set statusline+=\ %M
set statusline+=%= "Right side settings
set statusline+=%#Search#
set statusline+=[%{fugitive#head()}]
set statusline+=\ %c:%l/%L
set statusline+=\ [%p%%]

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nmap <leader>gh :diffget //3<CR>
nmap <leader>gl :diffget //2<CR>

"Python
lua require'lspconfig'.jedi_language_server.setup{on_attach=require'completion'.on_attach}
" PHP
lua require'lspconfig'.intelephense.setup{on_attach=require'completion'.on_attach}
" Go
lua require'lspconfig'.gopls.setup{on_attach=require'completion'.on_attach}
"C/C++
lua require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }

nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>fr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>rr :lua vim.lsp.buf.rename()<CR>


command! MakeTags !ctags -R .

"TODO: This does not work properly
command! -nargs=1 Dcup docker-compose up -f ./docker-compose.yml <q-args>  
command! Dcdown docker-compose down -f ./docker-compose.yml

let $FZF_DEFAULT_COMMAND = 'rg -i --ignore-file ./.gitignore  --files'
