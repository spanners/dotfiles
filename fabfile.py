from fabric.api import local

vim_bundles = [
    {
        'git': 'git://github.com/fatih/vim-go.git',
        'path': '~/.vim/bundle/vim-go'
    }
]

def apt_get():
    local('sudo apt-get update')
    local('sudo apt-get upgrade')
    # neovim instead of vim?
    local('sudo apt-get install zsh vim wget curl kitty suckless-tools \
           xautolock feh tmux neomutt mpd ncmpcpp vlc unp htop exa \
           keepassxc xdotool xclip rtorrent diffpdf xfce4 redshift-gtk \
           graphviz')

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
