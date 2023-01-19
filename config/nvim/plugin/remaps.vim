nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <c-b> <cmd>Telescope buffers<cr>
"nnoremap <leader>r :Rg<CR>
nnoremap <leader>gs :G<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap  <leader>% :vnew<CR>
nnoremap  <leader>" :split<CR>

nmap <leader>gh :diffget //3<CR>
nmap <leader>gl :diffget //2<CR>

" go to definition
nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
" go to implementation
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
" find references
nnoremap <leader>fr :lua vim.lsp.buf.references()<CR>
" rename variables
nnoremap <leader>rr :lua vim.lsp.buf.rename()<CR>
" view documentation
nnoremap <leader>vd :lua vim.lsp.buf.hover()<CR>

" Make tab key cycle through completion list
"inoremap <expr> <tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <s-tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Quickfix lixt stuffff!!!!!!!
nnoremap <C-q> :call ToggleQFList(1)<CR>
nnoremap <C-k> :cprev<CR>zz
nnoremap <C-j> :cnext<CR>zz

"Cicle througth tabs
nnoremap <c-tab> :tabnext<CR>zz
nnoremap <leader>tt :tabnew<CR>zz
nnoremap <leader>tn :tabnext<CR>zz
nnoremap <leader>tp :tabprev<CR>zz
nnoremap <leader>tq :tabclose<CR>zz

"Quickly open a notes file
nnoremap <leader>n :tab drop ~/notas.txt<CR>zz

" close local fixlist window
nnoremap <localleader>q :call ToggleQFList(0)<CR>zz
nnoremap <localleader>n :lnext<CR>zz
nnoremap <localleader>p :lprev<CR>zz

" As a default I want to run case insensitive searches
nnoremap / /\c\v


nnoremap <leader>/ :lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>


" after reindent a visual block I want to keep it selected
vnoremap > >gv
vnoremap < <gv
nnoremap <leader>o :ToggleOnly<CR>

" Save file with space+w
nnoremap <leader>w :w<CR>
nnoremap <leader>x :ChecklistToggleCheckbox<CR>zz

nnoremap <leader><leader>e :ReplToggle<CR>
nmap <leader>e <Plug>ReplSendLine
vmap <leader>e <Plug>ReplSendVisual
