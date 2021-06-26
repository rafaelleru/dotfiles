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
augroup END

augroup yank_highlight
    autocmd!
    au TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup="IncSearch", timeout=300})
augroup END

fun! SetQFControlVariable()
    if getwininfo(win_getid())[0]['loclist'] == 1
        let g:the_primeagen_qf_l = 1
    else
        let g:the_primeagen_qf_g = 1
    end
endfun

fun! UnsetQFControlVariable()
    if getwininfo(win_getid())[0]['loclist'] == 1
        let g:the_primeagen_qf_l = 0
    else
        let g:the_primeagen_qf_g = 0
    end
endfun


augroup fixlist
    autocmd!
    autocmd BufWinEnter quickfix call SetQFControlVariable()
    autocmd BufWinLeave * call UnsetQFControlVariable()
augroup END
