# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles/configuration repository containing various configuration files for development tools and shell environment setup.

## Structure

- `shell/` - Zsh shell configuration files including aliases, exports, and Zinit plugin manager
- `nvim/` - Neovim configuration using LazyVim framework
- `git/` - Git configuration with custom aliases and settings
- `ghostty/` - Ghostty terminal emulator configuration
- `mise/` - Mise tool version management configuration
- `kubeconfigs/` - Kubernetes configuration files
- `raycast/` - Raycast app configuration

## Key Configuration Details

### Shell Configuration
- Main entry point: `shell/init.zsh` (sourced from `~/.zshrc`)
- Uses Zinit for plugin management
- Powerlevel10k theme for prompt
- Custom aliases defined in `shell/alias.zsh`

### Common Git Aliases
- `gc` → `git commit` (commit staged files only, don't auto-add)
- `gs` → `git status --short`
- `gd` → `git diff`
- `ga` → `git add`
- `gp` → `git push origin @`

### Tool Versions
- Node.js: LTS version managed by Mise
- Editor: Neovim with LazyVim configuration

## Development Notes

- The repository is tracked in Git with master as the main branch
- Shell configurations use Zsh with custom aliases and functions
- Git is configured with various improvements including auto-correction, verbose commits, and rerere