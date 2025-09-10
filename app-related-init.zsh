# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"

# autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# mise
if command -v mise > /dev/null; then
  eval "$(mise activate zsh)"
  eval "$(mise hook-env)"
fi

# Archived

# # gcloud
# source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
# source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# PATH for GCloud SDK
# if [ -f '/Users/wildsky/.config/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/wildsky/.config/bin/google-cloud-sdk/path.zsh.inc'; fi

# Autocompletion for gcloud
# if [ -f '/Users/wildsky/.config/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/wildsky/.config/bin/google-cloud-sdk/completion.zsh.inc'; fi

# cargo env
# source ~/.cargo/env
# . "$HOME/.cargo/env"

# # ruby
# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.1.3 # run chruby to see actual version

# postgres?
# eval "$(/opt/homebrew/bin/brew shellenv)"
