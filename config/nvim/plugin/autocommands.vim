augroup rafaelleru
    autocmd!
    " Populate locallist with lsp diagnostics automatically 
    autocmd User LspDiagnosticsChanged :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
    " TODO: the nexts autocmd statements should not be necessary
    autocmd BufWrite *.py :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
    autocmd BufWrite *.php :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
    autocmd BufWrite *.go :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
    autocmd BufWrite *.rs :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
    autocmd BufWrite *.cpp,*.hpp,*.h,*.c :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
    autocmd BufWrite *.vim :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
    au TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup="IncSearch", timeout=300})
augroup END

