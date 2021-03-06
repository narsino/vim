
"Basic settings---------------------{{{
filetype on
colorscheme default
let mapleader = " "
let maplocalleader = "\\"
set wildmenu
set tw=80
set expandtab
set softtabstop=4
set shiftwidth=4
set ruler
set nu
set wrap
set shiftround
set foldlevel=20
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
vnoremap <leader>cp xPP
iabbrev adn and
iabbrev waht what
iabbrev tehn then   
iabbrev hdr <cr>Narsi Gangishetti<cr>Jawbone Corp.<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" <esc>'<i"<esc>'>$a"
"nnoremap <leader>w :execute "match ErrorMsg " . '/\v( )+$/'<cr>
"nnoremap <leader>W :execute "match None"<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>n :cnext<cr>
nnoremap <leader>p :cprevious<cr>
nnoremap <leader>H 0w
inoremap jk <esc>
"}}}


"don't do that!---------------------{{{
nnoremap :w<cr> <nop>
inoremap <del> <nop>
inoremap <esc> <nop>
"}}}

"search settings---------------------{{{
nnoremap / /\v
set ic
set smartcase
set hlsearch incsearch
nnoremap <leader>s :nohlsearch<cr>
"}}}

"grep settings---------------------{{{
:nnoremap <leader>g :silent :execute "grep! -R " . shellescape(expand('<cWORD>')) . " ."<cr>:copen 20<cr>
:nnoremap <leader>G :silent :execute "grep! -R " . shellescape(expand('<cword>')) . " ."<cr>:copen 20<cr>

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
"onoremap b /return<cr>
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
augroup END
"}}}

"CU file settings ---------------------{{{
augroup filetype_cu
    autocmd!
    autocmd FileType *.cu setlocal expandtab
    autocmd FileType *.cu setlocal softtabstop=2
    autocmd FileType *.cu setlocal shiftwidth=2
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

"Toggling foldcolumn ---------------------{{{
nnoremap <leader>f :call FoldColumnToggle()<cr>

function! FoldColumnToggle()
    if &foldcolumn 
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction
"}}}

"Toggling quick fix window---------------------{{{
nnoremap <leader>q :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
"}}}
