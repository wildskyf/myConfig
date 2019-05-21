echo "Install xcode command tool"
xcode-select --install

echo "Install Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Install dev tools"
brew install wget gcc gpp gpg rbenv rbenv-gemset ripgrep

echo "Install latest node.js"
curl "https://nodejs.org/dist/latest/node-${VERSION:-$(wget -qO- https://nodejs.org/dist/latest/ | sed -nE 's|.*>node-(.*)\.pkg</a>.*|\1|p')}.pkg" > "$HOME/Downloads/node-latest.pkg" && sudo installer -store -pkg "$HOME/Downloads/node-latest.pkg" -target "/"

echo "Install Caskroom"
brew tap caskroom/cask

echo "Install Applications..."
brew cask install firefox google-chrome nally iterm2 sequel-pro \
     telegram evernote colorpicker-developer appcleaner slack keka quip

echo "Install Fonts..."
brew tap caskroom/fonts
brew cask install font-source-code-pro
brew cask install font-fontawesome
brew cask install font-inconsolata-dz-for-powerline

# install QuickLook
# https://github.com/sindresorhus/quick-look-plugins
echo "Install QuoickLook Plugins..."
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql suspicious-package


git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh

echo "=========== FINISHED ==========="
echo "Ref: http://blog.visioncan.com/2014/introducing-cask/"







