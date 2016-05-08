#!/bin/sh

# Are you root?
if [ "$(id -u)" != 0 ]; then
  echo "You should run this script directly as root."
fi

echo "fastestmirror=true" >> /etc/dnf/dnf.conf

# Repos
dnf install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm
dnf install http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm
dnf copr enable nibbler/nodejs

dnf -y update

# Fonts
dnf -y install wqy*
dnf install -y cjkuni-ukai-fonts cjkuni-uming-fonts font-manager

# Gpaste Integration
dnf install gnome-shell-extension-gpaste -y

# Must
dnf -y install gnome-tweak-tool libreoffice-langpack-zh-Hant

# Editor
dnf install -y vim
wget https://atom.io/download/rpm /tmp/atom.rpm
dnf install -y /tmp/atom.rpm

# Dev
dnf install -y gcc gcc-c++ git tig ctags
dnf install -y eclipse
dnf install -y nodejs npm
npm install surge mocha gulp grunt -g
dnf install -y python3
dnf install -y ruby ruby-devel rubygems
gem install github-pages --no-ri --no-rdoc
gem install bundle --no-ri --no-rdoc
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p # FYI: https://github.com/guard/listen/wiki/Increasing-the-amount-of-inotify-watchers
dnf -y install codeblocks

dnf install -y compat-libstdc++-296.i686 compat-libstdc++-33.i686 compat-libstdc++-33.x86_64 ncurses-libs.i686 # for android studio
dnf install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm # google-chrome
dnf install -y gimp inkscape mypaint # Draw

# Input Method
dnf install -y fcitx fcitx-table-chinese fcitx-configtool fcitx-qt4 fcitx-chewing im-chooser
gsettings set org.gnome.settings-daemon.plugins.keyboard active false
echo "export GTK_IM_MODULE=fcitx" >> /etc/profile
echo "export QT_IM_MODULE=fcitx" >> /etc/profile
echo "export XMODIFIERS="@im=fcitx"" >> /etc/profile
im-chooser

# clone conf files
rm ~/.bashrc
rm ~/.vimrc
rm ~/.gitconfig
wget https://raw.githubusercontent.com/wi1d5ky/myConfig/master/.bashrc
wget https://raw.githubusercontent.com/wi1d5ky/myConfig/master/.vimrc
wget https://raw.githubusercontent.com/wi1d5ky/myConfig/master/.gitconfig
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Now, you can go to 'https://developer.android.com/sdk/index.html#downloads' to download tools that you need."
echo "Besides, you sholud install plugins for vim by using the command: ':PluginInstall'."

read -n1 -r -p "Press any key to continue..." key
