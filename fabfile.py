from fabric.api import local

vim_bundles = [
    {
        'git': 'git://github.com/mileszs/ack.vim.git',
        'path': '~/.vim/bundle/ack.vim'
    },
    {
        'git': 'git://github.com/tpope/vim-fugitive.git',
        'path': '~/.vim/bundle/vim-fugitive'
    },
    {
        'git': 'git://github.com/sjl/gundo.vim.git',
        'path': '~/.vim/bundle/gundo.vim'
    },
    {
        'git': 'git://github.com/ervandew/supertab.git',
        'path': '~/.vim/bundle/supertab'
    },
    {
        'git': 'git://github.com/Raimondi/delimitMate.git',
        'path': '~/.vim/bundle/delimitMate'
    },
    {
        'git': 'git://github.com/docunext/closetag.vim.git',
        'path': '~/.vim/bundle/closetag.vim'
    },
    {
        'git': 'git://github.com/majutsushi/tagbar.git',
        'path': '~/.vim/bundle/tagbar'
    },
    {
	'git': 'git://github.com/scrooloose/syntastic.git',
	'path': '~/.vim/bundle/syntastic'
    }
]

def apt_get():
    local('sudo apt-get update')
    local('sudo apt-get upgrade')
    local('sudo apt-get install zsh vim wget curl rxvt-unicode suckless-tools xautolock feh tmux mutt mpd ncmpcpp vlc p7zip unrar unzip htop keepassx xdotool xclip rtorrent diffpdf xfce4')

# Not using Haskell at the moment
#def cabal():
#    local('cabal update')
#    local('sudo cabal install yeganesh --global')
#    local('sudo cabal install hoogle hsenv ghc-mod hdevtools hlint pointfree')

def oh_my_zsh():
    local('curl -L http://install.ohmyz.sh | sh')
    local('cp ~/.zshrc.pre-oh-my-zsh ~/.zshrc')
    local('chsh -s $(which shell)')

def install_vim():
    local('mkdir -p ~/.vim/autoload ~/.vim/bundle')
    local('curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim')

    for bundle in vim_bundles:
        local('git clone ' + bundle['git'] + ' ' + bundle['path'])

    local('cd ~')

def update_vim():
    for bundle in vim_bundles:
        local('cd ' + bundle['path'] + ' && git pull')

    local('cd ~')
