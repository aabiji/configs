#/bin/sh

read  -n 1 -p "Setup Github SSH key: https://www.geeksforgeeks.org/using-github-with-ssh-secure-shell/" mainmenuinput

# Install software
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo add-apt-repository ppa:tomtomtom/yt-dlp
sudo apt update

sudo apt install curl git cmake p7zip-full ripgrep vim yt-dlp code stow gnome-tweaks
sudo apt install build-essential python3 python3-pip nodejs mesa-utils cloc tmux

cd Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
rm * && cd

sudo snap install obsidian --classic
sudo snap install go --classic
sudo snap remove --purge firefox 

curl -fsSL https://bun.sh/install | bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

pip install numpy torch

# Setup projects
cd && mkdir dev && cd dev
git clone git@github.com:aabiji/muse.git
git clone git@github.com:aabiji/disco.git
git clone git@github.com:aabiji/journal.git
git clone git@github.com:aabiji/vault.git
git clone git@github.com:aabiji/memos.git
git clone git@github.com:aabiji/configs.git
git clone git@github.com:aabiji/jpeg.git
git clone git@github.com:aabiji/adventofcode.git
git clone git@github.com:aabiji/scroll.git
git clone git@github.com:aabiji/page.git
git clone git@github.com:aabiji/dstore.git
git clone git@github.com:aabiji/mnist.rs.git
git clone git@github.com:aabiji/sudoku.git
git clone git@github.com:aabiji/mark.git
git clone git@github.com:aabiji/tetris.git

mkdir archive && cd archive && mkdir 2022 2023 2024 && cd ..
mv mark archive/2022 && mv tetris archive/2022
mv adventofcode archive/2023 && mv scroll archive/2023 && mv page archive/2023 && mv dstore archive/2023 && mv mnist.rs archive/2023 && mv sudoku archive/2023
mv jpeg archive/2024 && mv vault archive/2024

# Install muse
cd muse
sudo apt install libasound2-dev
cargo build --release
sudo mv target/release/muse /usr/bin/muse

# Load configs
cd ~/Downloads/configs
stow dotfiles -t $HOME

# Full update
sudo apt update && sudo apt upgrade && sudo apt autoremove
