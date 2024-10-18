# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# # gcloud
# source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
# source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# PATH for GCloud SDK
# if [ -f '/Users/wildsky/.config/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/wildsky/.config/bin/google-cloud-sdk/path.zsh.inc'; fi

# Autocompletion for gcloud
# if [ -f '/Users/wildsky/.config/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/wildsky/.config/bin/google-cloud-sdk/completion.zsh.inc'; fi

# cargo env
source ~/.cargo/env
# . "$HOME/.cargo/env"

# # ruby
# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.1.3 # run chruby to see actual version

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh
