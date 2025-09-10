# myConfig

Personal development environment configuration files for terminal, editor, Git, and various development tools.

## Quick Start

1. Clone this repository to `~/.config/`
2. `echo "source ~/.config/shell/init.zsh" >> ~/.zshrc`
3. Reload shell configuration

## Structure

### 🐚 Shell Configuration (`shell/`)
- **init.zsh** - Main entry point, loads all shell configurations
- **alias.zsh** - Command shortcuts and aliases
- **export.zsh** - Environment variables
- **zinit.zsh** - Zinit plugin manager configuration
- **p10k.zsh** - Powerlevel10k theme configuration

### 📝 Editor Configuration
- **nvim/** - Neovim configuration (using LazyVim framework)
  - LSP support, auto-completion, syntax highlighting
  - Custom key mappings and plugins

### 🔧 Development Tools
- **git/** - Global Git configuration and aliases
- **ghostty/** - Ghostty terminal emulator settings
- **mise/** - Tool version management (Node.js LTS)
- **kubeconfigs/** - Kubernetes configuration files
- **raycast/** - Raycast app configuration

## Key Features

### Git Shortcuts
- `gc` - git commit (commits only staged files)
- `gs` - concise git status
- `gd` - git diff
- `ga` - git add
- `gp` - git push to current branch

### Single-Character Commands
- `v` - nvim
- `g` - git
- `k` - kubectl
- `d` - orbctl (Docker)
- `cc` - claude

## Dependencies

- Zsh
- [Zinit](https://github.com/zdharma-continuum/zinit) - Zsh plugin manager
- [Neovim](https://neovim.io/) - Modern Vim editor
- [Mise](https://mise.jdx.dev/) - Tool version manager
- [bat](https://github.com/sharkdp/bat) - Better cat alternative
- [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) - Better git diff

## Customization

For private configurations, add files to `shell/private-configs/` directory. These files will be automatically loaded but not tracked by Git.
