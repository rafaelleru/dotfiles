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

syntax on

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
nnoremap <c-p> :FZF<CR>

Plugin 'junegunn/fzf.vim'

Plugin 'scrooloose/nerdtree'
nnoremap <leader>nt :NERDTreeToggleVCS<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

Plugin 'preservim/nerdcommenter'
filetype plugin on

Plugin 'tpope/vim-fugitive'
nnoremap <leader>gs :G<CR>

"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
"" TODO: Redefine this mappings
""let g:UltiSnipsExpandTrigger=""
""let g:UltiSnipsListSnippets=""
""let g:UltiSnipsJumpForwardTrigger          <c-j>
""let g:UltiSnipsJumpBackwardTrigger         <c-k>


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
call vundle#end()            " required

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_transparent_bg=2
let g:gruvbox_material_transparent_background=1
set background=dark    " Setting dark mode
colorscheme gruvbox-material

" statusline
set statusline=
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#CursorLineNr#
set statusline+=\ %F
set statusline+=\ %M
set statusline+=%= "Right side settings
set statusline+=%#Search#
set statusline+=%{FugitiveStatusline()}
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

" Python
lua require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
autocmd BufWrite *.py :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
" PHP
lua require'lspconfig'.intelephense.setup{ on_attach=require'completion'.on_attach }
autocmd BufWrite *.py :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
" Go
lua require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }
autocmd BufWrite *.py :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
" C/C++
lua require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }
autocmd BufWrite *.py :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
" Rust
lua require'lspconfig'.rls.setup{ on_attach=require'completion'.on_attach }
autocmd BufWrite *.py :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
" Vim language server
lua require'lspconfig'.vimls.setup{ on_attach=require'completion'.on_attach }
autocmd BufWrite *.py :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})

" Populate locallist with lsp diagnostics automatically 
" TODO: the previous autocmd statements should not be necessary
autocmd User LspDiagnosticsChanged :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})

" go to definition
nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
" go to implementation
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
" find references
nnoremap <leader>fr :lua vim.lsp.buf.references()<CR>
" rename variables
nnoremap <leader>rr :lua vim.lsp.buf.rename()<CR>
" view documentation
nnoremap <leader>vd :lua vim.lsp.buf.hover()<CR>

" Make tab key cycle through completion list
inoremap <expr> <tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Quickfix lixt stuffff!!!!!!!
nnoremap <C-q> :call ToggleQFList(1)<CR>
nnoremap <C-k> :cnext<CR>zz
nnoremap <C-j> :cprev<CR>zz

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

"Cicle througth tabs
nnoremap <c-tab> :tabnext<CR>zz
nnoremap <leader>tt :tabnew<CR>zz
nnoremap <leader>tn :tabnext<CR>zz
nnoremap <leader>tp :tabprev<CR>zz
nnoremap <leader>tq :tabclose<CR>zz

"Quickly open a notes file
nnoremap <leader>n :tab drop ~/notas.txt<CR>zz

" close local fixlist window
nnoremap <localleader>q :call ToggleQFList(0)<CR>zz
nnoremap <localleader>n :lnext<CR>zz
nnoremap <localleader>p :lprev<CR>zz

" As a default I want to run case insensitive searches
nnoremap / /\c
