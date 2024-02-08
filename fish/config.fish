set fish_greeting

set -x EDITOR nvim
set -x JAVA_HOME /usr/lib/jvm/default

fish_add_path ~/dev/archive/2022/tetris
fish_add_path ~/go/bin/
fish_add_path ~/.bun/bin

alias cat="bat"
alias cp="cp -r"
alias rm="rm -rf"
alias update="yay -Syu"
alias vim="nvim"
alias ls="eza --no-user --no-git --no-permissions -a -X -G --no-time --no-filesize"
