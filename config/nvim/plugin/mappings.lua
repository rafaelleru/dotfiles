vim.keymap.set('n', '<leader>w', ":w<CR>")
vim.keymap.set('n', '<leader>x', ":x<CR>")

-- Telescope
local builtin = require('telescope.builtin')
local rafaelleru = require('rafaelleru_functions')
vim.keymap.set('n', '<c-p>', rafaelleru.get_telescope_picker(), { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<c-/>', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<c-b>', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, { desc = 'Telescope LSP jump to definition' })
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'Telescope LSP references' })
-- TODO: make this command run in all project
vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, { desc = 'LSP rename in current buffer' })

vim.keymap.set('n', '<leader>d', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>tt', vim.cmd.tabnew)
vim.keymap.set('n', '<leader>tn', vim.cmd.tabnext)
vim.keymap.set('n', '<leader>tp', vim.cmd.tabprev)

-- window management
vim.keymap.set('n', '<leader>%', vim.cmd.split)
vim.keymap.set('n', '<leader>"', vim.cmd.vsplit)

-- TODO: clange "windcmd" strings
vim.keymap.set('n', '<leader>h', ":wincmd h<CR>")
vim.keymap.set('n', '<leader>j', ":wincmd j<CR>")
vim.keymap.set('n', '<leader>k', ":wincmd k<CR>")
vim.keymap.set('n', '<leader>l', ":wincmd l<CR>")

vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')


-- aerial nvim
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
vim.keymap.set("n", "<leader>gs", "<cmd>call aerial#fzf()<CR>") -- Stands for go to symbol
