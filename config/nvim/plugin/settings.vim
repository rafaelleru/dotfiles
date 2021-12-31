let mapleader = "\<Space>"
let maplocalleader = "\,"

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

let g:UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'      
let g:UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
let g:UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
let g:UltiSnipsListSnippets = '<c-x><c-s>'
let g:UltiSnipsRemoveSelectModeMappings = 0


let g:rg_command = "rg --vimgrep -S"

"let g:diminactive_use_colorcolumn = 0
"let g:diminactive_use_syntax = 1

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_transparent_bg=2
let g:gruvbox_material_transparent_background=1

" This has to be here, otherwise  transparent background will  not work
set background=dark    " Setting dark mode
" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme base16-bright

hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

hi Comment gui=italic cterm=italic

let g:the_primeagen_qf_l = 0
let g:the_primeagen_qf_g = 0

fun! ToggleQFList(global)
    if a:global
        if g:the_primeagen_qf_g == 1
            let g:the_primeagen_qf_g = 0
            cclose
        else
            let g:the_primeagen_qf_g = 1
            copen
        end
    else
        echo 'toggle locallist'
        if g:the_primeagen_qf_l == 1
            let g:the_primeagen_qf_l = 0
            lclose
        else
            let g:the_primeagen_qf_l = 1
            lopen
        end
    endif
endfun

let g:grepper               = {}
let g:grepper.tools         = ['rg', 'git']  "use rg since it shold be faster than git (I guess...)

let g:indentLine_conceallevel = 0  " This will show quotes in json files

let greppgr="rg -n"


" Use treesiter to provide folding settings.
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
