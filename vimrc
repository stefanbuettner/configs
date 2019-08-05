set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
"Plugin 'scrooloose/nerdtree'
"Plugin 'lervag/vimtex'
"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dracula/vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Allow vim to use any .vimrc file in the cwd. This is useful to specify
" project specific settings. Secure disables some commands for those .vimrc
" files.
"set exrc
"set secure

" Some default config file for YouCompleteMe
let g:ycm_global_ycm_extra_conf="~/.vim/.ycm_extra_conf.py"

syntax on
set background=dark
colorscheme dracula

set tabstop=4
set shiftwidth=4

" expand tabs by tabstop spaces
set expandtab
set number
set nocindent
set nosmartindent

" inoremap <S-Tab> "    "
nnoremap <F1> :YcmCompleter GetType<CR>
nnoremap <F2> :YcmCompleter GetDoc<CR>
nnoremap <F6> :YcmCompleter GoTo<CR>

