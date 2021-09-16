hi NormalColor guifg=Black guibg=Green ctermbg=46 ctermfg=0
hi InsertColor guifg=Black guibg=Cyan ctermbg=51 ctermfg=0
hi ReplaceColor guifg=Black guibg=maroon1 ctermbg=165 ctermfg=0
hi VisualColor guifg=Black guibg=Orange ctermbg=202 ctermfg=0

" statusline
set statusline=
set statusline+=\%#NormalColor#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=\%#InsertColor#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=\%#ReplaceColor#%{(mode()=='R')?'\ \ REPLACE\ ':''}
set statusline+=\%#VisualColor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#CursorLineNr#
set statusline+=\ %r
set statusline+=\%{WebDevIconsGetFileTypeSymbol()}
set statusline+=\ %f
set statusline+=\ %M
set statusline+=%= "Right side settings
set statusline+=%#Search#
set statusline+=%{FugitiveStatusline()}
set statusline+=\ %c:%l/%L
set statusline+=\ [%p%%]
