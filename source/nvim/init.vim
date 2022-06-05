if &compatible
	set nocompatible
endif

set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

call dein#begin('~/.local/share/dein/')

call dein#add('morhetz/gruvbox')
call dein#add('arcticicestudio/nord-vim')
call dein#add('jnurmine/Zenburn')
call dein#add('sonph/onehalf', { 'rtp': 'vim' })
call dein#add('junegunn/goyo.vim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('leafo/moonscript-vim')

call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
	call dein#install()
endif

if $TERM == 'alacritty' || $TERM == 'xterm-kitty'
	set termguicolors
endif

" appearance

set nu rnu
set cursorline
set cursorline
set copyindent autoindent
set noshowmode
set nohlsearch
set shortmess=I
set mouse=a

colorscheme onehalfdark
let g:airline_theme='onehalfdark'

" indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" airline
let g:airline#extensions#tabline#enabled = 1

" behavior

set splitbelow splitright
set autoread
set hidden

noremap <Space> <Nop>
let mapleader=" "

nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

autocmd TermOpen * setlocal nonu nornu
autocmd BufWritePost init.vim source %

let configpath="~/.config/nvim/init.vim"
command Config exec ':e ' . configpath
