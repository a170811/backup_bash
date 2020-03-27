"---------------------------Vundle----------------------------------
" Vundle tutorial on github: https://github.com/VundleVim/Vundle.vim
set nocompatible    " be iMproved, required
filetype off        " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"-----------------------Vundle plugins------------------------------
"--utility
" Indent line
Plugin 'Yggdroot/indentLine'

"----tabbar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"--git diff
Plugin 'airblade/vim-gitgutter'

"--Web
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/vim-javascript-syntax'

"----Jade
Plugin 'digitaltoad/vim-jade'

"----Stylus
Plugin 'wavded/vim-stylus'

" vim-better-whitespace
Plugin 'ntpeters/vim-better-whitespace'

"multiple-cursors
Plugin 'terryma/vim-multiple-cursors'

"----cursor line
Plugin 'miyakogi/conoline.vim'

"tcomment
Plugin 'tomtom/tcomment_vim'

"--RRethy/vim-illuminate
Plugin 'RRethy/vim-illuminate'

" All of your Plugins must be added before the following line
"-------------------------------------------------------------------
"call vundle#end()   " required
filetype plugin on  " required

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

" vi:sw=4:ts=4

set tabstop=4
set shiftwidth=4
