export POWERLEVEL9K_CONFIG_FILE="$HOME/.config/shell/p10k.zsh"

export KUBECONFIG="${KUBECONFIG}:$(find ~/.config/kubeconfigs -type f -maxdepth 1 | tr '\n' ':')"

# Rust
export RUST_WITHOUT=rust-docs
# export CARGO_TARGET_DIR=".cargo-target"

# ASDF
# export ASDF_DATA_DIR="$HOME/.config/asdf/data"
# export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME="$HOME/.config/asdf/tool-versions"

# disable less history file
export LESSHISTFILE=-


###################################################
# PATH

# User Apps
export PATH="/Users/wildsky/bin:$PATH"

# uv
export PATH="/Users/wildsky/.local/bin:$PATH"

# BasicTex
export PATH="/usr/local/texlive/2024basic/bin/universal-darwin/:$PATH"

export PATH="/Library/Java/JavaVirtualMachines/jdk-22.jdk/Contents/Home/bin:$PATH"

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# for x86 brew
# alias brew86='/usr/local/bin/brew'
# ref: https://blog.wildsky.cc/posts/try-game-porting-toolkit-to-play-ragnarok-online-but-failed/
export PATH="/opt/homebrew/opt/gawk/libexec/gnubin/:$PATH"
export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"

export PATH="/Users/wildsky/go:$PATH"


# for react native
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
