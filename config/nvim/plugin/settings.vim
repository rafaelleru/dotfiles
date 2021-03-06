let mapleader = "\<Space>"
let maplocalleader = "\,"

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"" TODO: Redefine this mappings
""let g:UltiSnipsListSnippets=""
let g:UltiSnipsExpandTrigger="<C-t>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

let g:completion_enable_snippet = 'UltiSnips'
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_trigger_on_delete = 1

let g:rg_command = "rg --vimgrep -S"

let g:diminactive_use_colorcolumn = 0
let g:diminactive_use_syntax = 1

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_transparent_bg=2
let g:gruvbox_material_transparent_background=1

" This has to be here, otherwise  transparent background will  not work
set background=dark    " Setting dark mode
colorscheme gruvbox-material

let g:the_primeagen_qf_l = 0
let g:the_primeagen_qf_g = 0

fun! ToggleQFList(global)
    if a:global
        if g:the_primeagen_qf_g == 1
            cclose
        else
            copen
        end
    else
        echo 'toggle locallist'
        if g:the_primeagen_qf_l == 1
            lclose
        else
            lopen
        end
    endif
endfun

let g:grepper               = {}
let g:grepper.tools         = ['rg', 'git']  "use rg since it shold be faster than git (I guess...)
