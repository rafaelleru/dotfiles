-- init.lua

-- Establecer líder y local líder
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Configurar opciones
vim.opt.colorcolumn = "110"

-- Configurar lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- La rama estable
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { 'gmarik/Vundle.vim' },
  -- { 'sainnhe/gruvbox-material' },
  -- { 'morhetz/gruvbox' },
  { 'folke/tokyonight.nvim' },
  { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end },
  { 'junegunn/fzf.vim' },
  { 'preservim/nerdcommenter' },
  { 'tpope/vim-fugitive' },
  { 'luochen1990/indent-detector.vim' },
  { 'neovim/nvim-lspconfig' },
  { 'nvim-lua/completion-nvim' },
  { 'mhinz/vim-grepper' },
  { 'tpope/vim-sleuth' },
  { 'cespare/vim-toml' },
  { 'Yggdroot/indentLine' },
  { 'junegunn/goyo.vim' },
  { 'blueyed/vim-diminactive' },
  { 'tpope/vim-rhubarb' },
  -- { 'tommcdo/vim-fubitive' },
  { 'tommcdo/vim-lion' },
  { 'romainl/vim-qf' },
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  },
  { 'nvim-lua/plenary.nvim' },
  { 'lewis6991/gitsigns.nvim' },
  { 'nvim-lua/popup.nvim' },
  { 'nvim-telescope/telescope.nvim' },
  { 'mhartington/oceanic-next' },
  { 'chriskempson/base16-vim' },
  { 'ryanoasis/vim-devicons' },
  { 'wuelnerdotexe/vim-enfocado' },
  { 'pbrisbin/vim-mkdir' },
  -- Completion stuff
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip', tag = 'v1.*' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'hrsh7th/cmp-nvim-lsp-signature-help' },
  { 'sbdchd/neoformat' },
  { 'unblevable/quick-scope' },
  { 'declancm/maximize.nvim' },
  { 'editorconfig/editorconfig-vim' },
  { 
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
  },
  { 'mfussenegger/nvim-dap' },
  { 'evansalter/vim-checklist' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'nvim-telescope/telescope-live-grep-args.nvim' },
  { 'rafamadriz/friendly-snippets' },
  { 'tpope/vim-repeat' },
  { 'pappasam/nvim-repl' },
  {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    ft = { 'markdown', 'vim-plug' },
  },
  { 'kevinhwang91/promise-async' },
  { 'kevinhwang91/nvim-ufo' },
  { 'nvim-treesitter/nvim-treesitter-context' },
  { 'stevearc/aerial.nvim' },
  { 'MunifTanjim/nui.nvim' },
  { 'folke/trouble.nvim' },
  { 'jackMort/ChatGPT.nvim' },
  { 'nvim-lualine/lualine.nvim' },
  { 'nvim-tree/nvim-web-devicons' },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {}
  },
})

-- Configuración adicional
vim.g.repl_filetype_commands = {
  javascript = 'node',
  python = 'ipython',
}
vim.g.repl_split = 'bottom'
