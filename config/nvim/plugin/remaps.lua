-- remaps.lua

-- Función para mapear teclas de forma más sencilla
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Normal mode mappings
map('n', '<c-p>', '<cmd>Telescope find_files<cr>')
map('n', '<c-b>', '<cmd>Telescope buffers<cr>')
-- map('n', '<leader>r', ':Rg<CR>')
map('n', '<leader>gs', ':G<CR>')

map('n', '<leader>h', ':wincmd h<CR>')
map('n', '<leader>j', ':wincmd j<CR>')
map('n', '<leader>k', ':wincmd k<CR>')
map('n', '<leader>l', ':wincmd l<CR>')

map('n', '<leader>%', ':vnew<CR>')
map('n', '<leader>"', ':split<CR>')

map('n', '<leader>gh', ':diffget //3<CR>')
map('n', '<leader>gl', ':diffget //2<CR>')

-- LSP mappings
map('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>')
map('n', '<leader>gi', ':lua vim.lsp.buf.implementation()<CR>')
map('n', '<leader>fr', ':lua vim.lsp.buf.references()<CR>')
map('n', '<leader>rr', ':lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>vd', ':lua vim.lsp.buf.hover()<CR>')

-- Quickfix list mappings
map('n', '<C-q>', ':call ToggleQFList(1)<CR>')
map('n', '<C-k>', ':cprev<CR>zz')
map('n', '<C-j>', ':cnext<CR>zz')

-- Tab mappings
map('n', '<c-tab>', ':tabnext<CR>zz')
map('n', '<leader>tt', ':tabnew<CR>zz')
map('n', '<leader>tn', ':tabnext<CR>zz')
map('n', '<leader>tp', ':tabprev<CR>zz')
map('n', '<leader>tq', ':tabclose<CR>zz')

-- Open notes file
map('n', '<leader>n', ':tab drop ~/notas.txt<CR>zz')

-- Local fix list mappings
map('n', '<localleader>q', ':call ToggleQFList(0)<CR>zz')
map('n', '<localleader>n', ':lnext<CR>zz')
map('n', '<localleader>p', ':lprev<CR>zz')

-- Case insensitive search
map('n', '/', '/\\c\\v')

-- Telescope live grep args
map('n', '<leader>/', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- Visual mode mappings
map('v', '>', '>gv')
map('v', '<', '<gv')

-- Misc mappings
map('n', '<leader>o', ':ToggleOnly<CR>')
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>q', ':q<CR>')
map('n', '<leader>x', ':x<CR>zz')

-- Repl mappings
map('n', '<leader><leader>e', ':ReplToggle<CR>')
vim.api.nvim_set_keymap('n', '<leader>e', '<Plug>ReplSendLine', { silent = true })
vim.api.nvim_set_keymap('v', '<leader>e', '<Plug>ReplSendVisual', { silent = true })

-- Tab management
map('n', '<C-n>', ':tabnew<CR>zz')
map('n', '<C-w>', ':tabclose<CR>zz')
map('n', '<leader><tab>', ':echo "hola"<CR>zz')
