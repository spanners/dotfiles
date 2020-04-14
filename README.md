The dotfiles I am currently using. I have also included a fabfile for [Fabric](http://www.fabfile.org/) to make it easier to install and manage dependencies, most of which assume that you're using Debian.

Steps to get a basic install going:

1. Install Debian Buster
1. `sudo apt-get install git fabric`
1. `git clone https://github.com/spanners/dotfiles.git ~`
1. `fab apt_get`
1. `fab oh_my_zsh`
1. `fab install_vim`

You can update all the Vim bundles using
* `fab update_vim`
