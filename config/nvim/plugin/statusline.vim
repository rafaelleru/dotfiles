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
