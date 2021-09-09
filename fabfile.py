from fabric.api import local, abort
from fabric.contrib.console import confirm

vim_bundles = [
    {
        'git': 'git://github.com/fatih/vim-go.git',
        'path': '~/.vim/bundle/vim-go'
    }
]

def apt_get():
    local('sudo apt-get update')
    local('sudo apt-get upgrade')
    local('sudo apt-get install zsh neovim wget curl kitty suckless-tools \
           xautolock feh tmux neomutt mpd ncmpcpp vlc unp htop \
           keepassxc xdotool xclip rtorrent diffpdf xfce4 redshift-gtk \
           graphviz')

def sparkdev12_nvidia_1():
    """
    SPARKDEV12 machine has the following graphics card:

    NVIDIA GK208 [GeForce GT 710B] (rev a1)
    Supported by default drivers and legacy driver series 390.
    It is recommended to install the
        nvidia-driver
        package.
    """
    local('sudo apt-get update')
    local('sudo apt-get upgrade')
    local('sudo apt-get install linux-headers-amd64 nvidia-detect')
    result = local('nvidia-detect', capture=True)
    if "nvidia-driver" not in result.stdout \
            and not confirm("nvidia-driver not suggested by "
                            "nvidia-detect. Continue to install "
                            "anyway?"):
        abort("Aborting at user request")
    local('sudo apt-get install firmware-misc-nonfree')
    local('sudo apt-get install nvidia-driver nvidia-xconfig')
    print("You should run fab sparkdev12_nvidia_2 after reboot")
    if confirm("It is recommended to reboot now. Reboot?"):
        local("sudo reboot")

def sparkdev12_nvidia_2():
    local('sudo nvidia-xconfig')

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
