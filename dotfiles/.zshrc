export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR="nvim"

export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

alias v="nvim"
alias rm="rm -rf"
alias cp="cp -r"
alias ls="ls -a --color"
alias activate="source .venv/bin/activate"
alias update="sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo snap refresh"
alias push="git add -p && git commit && git push"
alias journal="cd ~/dev/journal && ./update.py && cd"

# Rust cargo
. "$HOME/.cargo/env"

# bun completions
[ -s "/home/aabiji/.bun/_bun" ] && source "/home/aabiji/.bun/_bun"
