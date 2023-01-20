augroup rafaelleru
    autocmd!
    " Populate locallist with lsp diagnostics automatically 
    autocmd User LspDiagnosticsChanged :lua vim.diagnostic.setloclist({open = false})
    " TODO: the nexts autocmd statements should not be necessary
    autocmd BufWrite *.py :lua vim.diagnostic.setloclist({open = false})
    autocmd BufEnter *.py :lua vim.diagnostic.setloclist({open = false})
    autocmd BufWrite *.php :lua vim.diagnostic.setloclist({open = false})
    autocmd BufWrite *.go :lua vim.diagnostic.setloclist({open = false})
    autocmd BufWrite *.rs :lua vim.diagnostic.setloclist({open = false})
    autocmd BufWrite *.cpp,*.hpp,*.h,*.c :lua vim.diagnostic.setloclist({open = false})
    autocmd BufWrite *.vim :lua vim.diagnostic.setloclist({open = false})
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
    autocmd BufCreate quickfix call SetQFControlVariable()
    autocmd BufWinLeave * call UnsetQFControlVariable()
augroup END

augroup last_position
    autocmd!
    au BufEnter * silent! exe "normal! g'\""
augroup END
