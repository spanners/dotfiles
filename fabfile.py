from fabric.api import local

vim_bundles = [
    {
        'git': 'git://github.com/altercation/vim-colors-solarized.git',
        'path': '~/.vim/bundle/vim-colors-solarized'
    },
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
    local('sudo apt-get install ruby ruby-dev zsh tk vim-gtk wget curl cabal-install rxvt-unicode xmonad xmobar suckless-tools xautolock feh tmux mutt conky mpd ncmpcpp vlc thunar thunar-volman p7zip wxgtk2.8 unrar unzip keepassx happy libssl-dev mono-dmcs xdotool xcliprtorrent')

def cabal():
    local('cabal update')
    local('sudo cabal install yeganesh --global')
    local('sudo cabal install hoogle hsenv ghc-mod hdevtools hlint pointfree')

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
