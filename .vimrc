set scrolloff=8

" exit insert mode with esc
inoremap <c-c> <esc>

" dont cut with paste
vnoremap p "_dp

" centre after motions
nnoremap n nzz
nnoremap N Nzz
nnoremap <c-u> <c-u>zz
nnoremap <c-d> <c-d>zz

" move between panes
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" move panes
nnoremap <a-h> <c-w>H
nnoremap <a-j> <c-w>J
nnoremap <a-k> <c-w>K
nnoremap <a-l> <c-w>L

" resize panes
nnoremap  <c-left> <c-w>>
nnoremap  <c-down> <c-w>+
nnoremap    <c-up> <c-w>-
nnoremap <c-right> <c-w><
