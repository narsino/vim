
"Basic settings---------------------{{{
colorscheme default
let mapleader = " "
let maplocalleader = "\\"
set wildmenu
set tw=80
set expandtab
set softtabstop=4
set shiftwidth=4
set ruler
set ic
set smartcase
set hlsearch incsearch
set spell
set nu
set wrap
set shiftround
set foldlevelstart=0
nnoremap _ ddO<esc>pk
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwU 
"set relativenumber
"noremap <leader>y yiw
"noremap S viw"0p
"set iskeyword+=_
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>pb :execute "rightbelow vsplit " . bufname('#')<cr>
iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev hdr <cr>Narsi Gangishetti<cr>Jawbone Corp.<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" <esc>'<i"<esc>'>$a"
nnoremap <leader>H 0w
inoremap jk <esc>
inoremap <esc> <nop>
"}}}

"Operator pending settings ---------------------{{{
"operator-pending mapping
"1. Start at the cursor position. 
"2. Enter visual mode (charwise). 
"3. ... mapping keys go here ... 
"4. All the text you want to include in the movement should now be selected.
" If your operator-pending mapping ends with some text visually selected, Vim
" will operate on that text.
" Otherwise, Vim will operate on the text between the original cursor position
" and the new position.

onoremap p i(
onoremap b /return<cr>
onoremap in( :<c-u>normal! f(vi)<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap an( :<c-u>normal! f(va)<cr>
onoremap al( :<c-u>normal! F)va(<cr>

onoremap in{ :<c-u>normal! f{vi}<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap an{ :<c-u>normal! f{va}<cr>
onoremap al{ :<c-u>normal! F}va{<cr>
"more operator-pending mappings
onoremap in@ :<c-u>execute "normal! /\\<\\w\\+@\\w\\+\\.\\w\\+\\>\rvg_"<cr> 
"}}}

"Python filetype auto grouping ---------------------{{{
"buffer-local abbreviations
"autocommand groups
augroup filetype_python
    autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>c I# <esc>
    autocmd FileType python :iabbrev <buffer> iff if:<left> 
    autocmd FileType python :iabbrev <buffer> deff def:<left> 
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType vim setlocal nospell
augroup END
"}}}

"Markdown file settings ---------------------{{{
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown onoremap <buffer> ih :<c-u>execute "normal! ?\\(^==\\+\\)\\\|\\(^--\\+\\)$\r:nohlsearch\rkvg_"<cr> 
    autocmd FileType markdown onoremap <buffer> ah :<c-u>execute "normal! ?\\(^==\\+\\)\\\|\\(^--\\+\\)$\r:nohlsearch\rg_vk0"<cr> 
augroup END
"}}}

"Asm file settings ---------------------{{{
augroup filetype_asm
    autocmd!
    autocmd FileType asm nnoremap <buffer> <localleader>c I// <esc>
    autocmd FileType asm setlocal foldmethod=indent
    autocmd FileType vim setlocal nospell
augroup END
"}}}

"Vimscript file settings ---------------------{{{
"fold this file
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker 
    autocmd FileType vim setlocal nospell
augroup END
"}}}

"Status line settings ---------------------{{{
"status line customization
set statusline=%f
set statusline+=%M
set statusline+=%=
set statusline+=%l
set statusline+=/
set statusline+=%L
"}}}


