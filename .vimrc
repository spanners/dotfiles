set nocompatible
execute pathogen#infect()

" Enable syntax highlighting
syntax enable

" Auto-indentation (I think?)
filetype plugin indent on

" 256-colour terminal
set t_Co=256

" Colourscheme 'koehler' looks good in situ
"colorscheme koehler

" Colourscheme 'evening' looks good over ssh tmux
colorscheme evening

if has('gui_running')
    set background=light
else
    set background=dark
endif

" ----------------
" General settings
" ----------------

let mapleader=','

set nobackup
set nowritebackup

" Show line numbers
set number

" Highlight search
set hlsearch
set incsearch

" Expand tabs into spaces
set expandtab

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set backspace=indent,eol,start

" UTF-8 yeahhhhhh
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

" ---------------
" Plugin settings
" ---------------

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

" Email composition with mutt
au BufRead /tmp/mutt-* set tw=72

" Mouse scrolling
set mouse=a

" Strip trailing whitespace
autocmd FileType c,cpp,java,php,python,ada autocmd BufWritePre <buffer> %s/\s\+$//e

" Pasting as-is, disabling autoindentation.
" I never want to have to type this again.
set paste
