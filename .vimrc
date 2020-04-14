set nocompatible
execute pathogen#infect()

" Set the Solarized color scheme
syntax enable
filetype plugin indent on
set t_Co=256
colorscheme koehler

if has('gui_running')
    set background=light
else
    set background=dark
endif

" General settings
let mapleader=','

set nobackup
set nowritebackup

set nu

set hlsearch
set incsearch

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set backspace=indent,eol,start

" Powerline
set laststatus=2

" ack.vim
nmap <leader>a <Esc>:Ack! 

" Gundo
nnoremap <F5> :GundoToggle<CR>

" TagBar
map <F6> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" Syntastic
map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>
let g:syntastic_auto_loc_list = 1

" GHC mod
map <silent> tu :call GHC_BrowseAll()<CR>
map <silent> tw :call GHC_ShowType(1)<CR>

" hdevtools
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

" pointfree
autocmd BufEnter *.hs set formatprg=pointfree

" mutt
au BufRead /tmp/mutt-* set tw=72

" UTF-8 for the win
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
