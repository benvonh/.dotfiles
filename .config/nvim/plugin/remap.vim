" exit insert mode
inoremap kk <esc>

" moving between panes
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" leader
let mapleader=' '

" basic commands
nnoremap <leader>w :w<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>c :q<cr>

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" nvim tree
noremap <leader>tt <cmd>NvimTreeToggle<cr>
noremap <leader>tf <cmd>NvimTreeFindFile<cr>
