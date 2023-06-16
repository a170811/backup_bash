"---------------------------vim-plug----------------------------------
" Install vim-plug if we don't already have it
if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"-----------------------vim-plug plugins------------------------------
"--utility
" vim ale
Plug 'dense-analysis/ale'

" Indent line
Plug 'Yggdroot/indentLine'

"----tabbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"--git diff
Plug 'airblade/vim-gitgutter'

"----Stylus
Plug 'wavded/vim-stylus'

" vim-better-whitespace
Plug 'ntpeters/vim-better-whitespace'

"multiple-cursors
Plug 'terryma/vim-multiple-cursors'

"----cursor line
Plug 'miyakogi/conoline.vim'

"tcomment
Plug 'tomtom/tcomment_vim'

"--RRethy/vim-illuminate
Plug 'RRethy/vim-illuminate'

" supertab
Plug 'ervandew/supertab'

" language highlight
Plug 'sheerun/vim-polyglot'

" vundle
Plug 'tell-k/vim-autopep8'

" All of your Plugins must be added before the following line
"-------------------------------------------------------------------
call plug#end()

"------------------------plugins setting----------------------------
"--airline
set laststatus=2                                    " set status line
let g:airline_powerline_fonts=1                     " enable powerline fonts
let g:airline#extensions#tabline#enabled=1          " enable tabline
let g:airline#extensions#tabline#left_sep=' '       " set left separator
let g:airline#extensions#tabline#left_alt_sep='|'   " set left separator which are not editing
let g:airline#extensions#tabline#buffer_nr_show=1   " show buffer number
let g:airline_theme='tomorrow'
"--indentline
let g:indentLine_color_term = 239
let g:indentLine_char = '|'
let g:indentLine_conceallevel=1
let g:pymode_lint_ignore = 'E502'
"--vim-illuminate
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234
highlight Cursor guibg=Black

hi illuminatedWord cterm=reverse ctermbg=Black   gui=underline
let g:Illuminate_delay = 10
let g:Illuminate_ftHighlightGroups = {
\ 'vim': ['vimVar', 'vimString', 'vimLineComment',
\         'vimFuncName', 'vimFunction', 'vimUserFunc', 'vimFunc']
\ }
"--autopep8
autocmd FileType python set equalprg=autopep8\ -
"--ale
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'go': ['vet', 'errcheck'],
\   'python': ['flake8', 'pylint'],
\}
let g:ale_python_flake8_options = '--ignore=E501,W291,N806,F405'

let g:ale_fixers = {
\ 'go': ['gofumpt', 'goimports'],
\ 'python': ['autopep8','yapf'],
\}

nnoremap <silent> <C-U> :ALEPreviousWrap<CR>
nnoremap <silent> <C-D> :ALENextWrap<CR>

"------------------------general setting----------------------------
"--search highlight
syntax on
set expandtab
set smarttab
set nocompatible
set nowrap
set wildmenu
set backupdir=~/tmp,.,/var/tmp/vi,/tmp
set directory=~/tmp,/var/tmp/vi,/tmp,.
set nobackup		                        " keep a backup file
set tabstop=2
set shiftwidth=2
set bs=2		                            " allow backspacing over everything in insert mode
set ai			                            " always set autoindenting on
set viminfo='20,\"50	                    " read/write a .viminfo file, don't store more
set showmatch
set noundofile
set cursorline
set conceallevel=1

"--Diff
nnoremap <silent> <C-G>	:diffget<CR>
nnoremap <silent> <C-P>	:diffput<CR>

"--Window
nnoremap <silent> <Tab>	:wincmd w<CR>
nnoremap <silent> <C-H>	:wincmd h<CR>
nnoremap <silent> <C-J>	:wincmd j<CR>
nnoremap <silent> <C-K>	:wincmd k<CR>
nnoremap <silent> <C-L>	:wincmd l<CR>
nnoremap <silent> +	:wincmd +<CR>
nnoremap <silent> -	:wincmd -<CR>
nnoremap <silent> <	:wincmd <<CR>
nnoremap <silent> >	:wincmd ><CR>

"--mine
vmap <Tab> gc

" VIM 6.0, We're using VIM on ntucs? Solaris, my own build
if version >= 600
    set nohlsearch
    set foldmethod=marker
    set foldlevel=0
    set encoding=utf-8
    set fileencodings=utf-8,big5,ucs-bom,latin1
    set termencoding=utf-8
else
    set fileencoding=taiwan
endif
au BufNewFile,BufRead *.less set filetype=less

"-------------------------color setting-----------------------------
set t_Co=256
colorscheme torte

hi Comment ctermfg=Red

" --- Set shiftwidth and softtabstop --- "
" autocmd FileType yaml,html,css,javascript,ls,vue setlocal expandtab shiftwidth=2 softtabstop=2
" autocmd FileType javascript setlocal filetype=javascript.jsx
autocmd FileType javascript.jsx setlocal autoindent
autocmd FileType pug,sass,styl setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType perl,python,java setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType sh,make setlocal shiftwidth=4 tabstop=4
autocmd FileType c,cuda,cpp setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType php setlocal shiftwidth=4 tabstop=4 expandtab
autocmd BufNewFile *.h setlocal shiftwidth=4 tabstop=4 expandtab

autocmd BufNewFile,BufEnter *.vue setfiletype vue
autocmd FileType vue setlocal autoindent expandtab shiftwidth=2 softtabstop=2 commentstring=//\ %s comments=://
\ | syntax include @PUG syntax/pug.vim | unlet b:current_syntax
\ | syntax include @JS syntax/javascript.vim | unlet b:current_syntax
\ | syntax include @SASS syntax/sass.vim | unlet b:current_syntax
\ | syntax region vueTemplate matchgroup=vueTag start=/^<template.*>$/ end='</template>' contains=@PUG keepend
\ | syntax region vueScript matchgroup=vueTag start=/^<script.*>$/ end='</script>' contains=@JS keepend
\ | syntax region vueStyle matchgroup=vueTag start=/^<style.*>$/ end='</style>' contains=@SASS keepend
\ | syntax match htmlArg /v-text\|v-html\|v-if\|v-show\|v-else\|v-for\|v-on\|v-bind\|v-model\|v-pre\|v-cloak\|v-once/ contained
\ | syntax keyword htmlArg contained key ref slot
\ | syntax keyword htmlTagName contained component transition transition-group keep-alive slot
\ | syntax sync fromstart
highlight vueTag ctermfg=Blue
