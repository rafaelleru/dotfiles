-- autocommands.lua

-- Crear grupos de autocomandos
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Grupo de autocomandos rafaelleru
augroup('rafaelleru', { clear = true })

autocmd('User', {
  pattern = 'LspDiagnosticsChanged',
  group = 'rafaelleru',
  callback = function() vim.diagnostic.setloclist({ open = false }) end,
})

local file_types = { '*.py', '*.php', '*.go', '*.rs', '*.cpp', '*.hpp', '*.h', '*.c', '*.vim' }

for _, pattern in ipairs(file_types) do
  autocmd('BufWritePost', {
    pattern = pattern,
    group = 'rafaelleru',
    callback = function() vim.diagnostic.setloclist({ open = false }) end,
  })
  autocmd('BufEnter', {
    pattern = pattern,
    group = 'rafaelleru',
    callback = function() vim.diagnostic.setloclist({ open = false }) end,
  })
end

-- Grupo de autocomandos yank_highlight
augroup('yank_highlight', { clear = true })

autocmd('TextYankPost', {
  pattern = '*',
  group = 'yank_highlight',
  callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 300 }) end,
})

-- Funciones SetQFControlVariable y UnsetQFControlVariable en Lua
local function SetQFControlVariable()
  if vim.fn.getwininfo(vim.fn.win_getid())[1].loclist == 1 then
    vim.g.the_primeagen_qf_l = 1
  else
    vim.g.the_primeagen_qf_g = 1
  end
end

local function UnsetQFControlVariable()
  if vim.fn.getwininfo(vim.fn.win_getid())[1].loclist == 1 then
    vim.g.the_primeagen_qf_l = 0
  else
    vim.g.the_primeagen_qf_g = 0
  end
end

-- Grupo de autocomandos fixlist
augroup('fixlist', { clear = true })

autocmd('BufWinEnter', {
  pattern = 'quickfix',
  group = 'fixlist',
  callback = function() SetQFControlVariable() end,
})

autocmd('BufCreate', {
  pattern = 'quickfix',
  group = 'fixlist',
  callback = function() SetQFControlVariable() end,
})

autocmd('BufWinLeave', {
  pattern = '*',
  group = 'fixlist',
  callback = function() UnsetQFControlVariable() end,
})

-- El grupo last_position está comentado en el archivo original, por lo que no se convierte
--[[
augroup('last_position', { clear = true })

autocmd('BufEnter', {
  pattern = '*',
  group = 'last_position',
  command = 'silent! exe "normal! g\'\""',
})
]]
