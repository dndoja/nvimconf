let mapleader = " "

inoremap jj <ESC>
inoremap <A-BS> <ESC>dvba
inoremap <A-RIGHT> <ESC>ea
inoremap <A-LEFT> <ESC>gea

inoremap <D-z> <C-O>u
inoremap <D-S-z> <C-O><C-r>

nnoremap <D-z> u
nnoremap <D-S-z> <C-r> 

nnoremap <A-S-Up> <Up>"add"ap<Up>
inoremap <A-S-Up> <Esc><Up>"add"ap<Up>
nnoremap <A-S-Down> "add"ap
inoremap <A-S-Down> <Esc>"add"ap

nnoremap <S-CR> i<CR><ESC>O
inoremap <S-CR> <CR><ESC>O
nnoremap <D-l> <cmd>Telescope find_files<cr>
xnoremap <A-S-Up> d<Up>mmP'm<Up>

nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

vnoremap < <gv
vnoremap > >gv

nnoremap <D-f> :/
nnoremap <D-r> :s

nnoremap { }
nnoremap } {
nnoremap { }
nnoremap } {
vnoremap { }
vnoremap } {
vnoremap { }
vnoremap } {

nnoremap <leader>f :lua vim.lsp.buf.format()<CR>
nnoremap <leader>r :lua vim.lsp.buf.rename()<CR>
nnoremap <A-CR> :lua vim.lsp.buf.code_action()<CR>
nnoremap <D-S-f> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap tq <cmd>tabc<cr>

set tabstop=4
set shiftwidth=4
set expandtab
set relativenumber

set expandtab
set clipboard+=unnamedplus
set cindent
set scrolloff=5
set updatetime=1000
set cursorline

autocmd FileType dart setlocal shiftwidth=2 tabstop=2

lua require("init")
