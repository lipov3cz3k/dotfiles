#!/bin/sh
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# source
plug "$HOME/.config/zsh/aliases.zsh"

# plugins
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "wintermi/zsh-starship"
plug "chrishrb/zsh-kubectl"

# Load and initialise completion system
autoload -Uz compinit
compinit

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
