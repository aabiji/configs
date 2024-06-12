export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR="vim"

export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
export PATH=/home/aabiji/Downloads/dart-sdk/bin:$PATH
export JAVA_HOME="/usr/lib/jvm/java-21-openjdk"

alias journal="cd ~/dev/journal && ./update.py && cd"
alias ls="ls -a --color"
alias rm="rm -rf"
alias cp="cp -r"
alias python="python3"
alias activate="source .venv/bin/activate"

# Rust cargo
. "$HOME/.cargo/env"

# bun completions
[ -s "/home/aabiji/.bun/_bun" ] && source "/home/aabiji/.bun/_bun"
