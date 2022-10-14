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

Plug 'luochen1990/indent-detector.vim'

Plug 'neovim/nvim-lspconfig'
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
"Plug 'tommcdo/vim-fubitive'

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
Plug 'sbdchd/neoformat'
Plug 'unblevable/quick-scope' " highlight relevant characters in the current line to quickly jump to words using f,F,t,T
Plug 'caenrique/nvim-maximize-window-toggle' " Toggle the nvim current window to be maximized or not
Plug 'editorconfig/editorconfig-vim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'mfussenegger/nvim-dap'
Plug 'hrsh7th/nvim-compe'
Plug 'evansalter/vim-checklist'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
call plug#end()            " required

lua << EOF
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "pylsp", "rust_analyzer", "clangd", "vimls" },
    automatic_installation = true
})
EOF

" Python
lua << EOF
require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          maxLineLength = 120
        }
      }
    }
  }
}
EOF

" PHP
"lua require'lspconfig'.intelephense.setup{}
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
