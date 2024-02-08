#/bin/sh

sudo add-apt-repository ppa:tomtomtom/yt-dlp
sudo apt update

read  -n 1 -p "Setup Github SSH key: https://www.geeksforgeeks.org/using-github-with-ssh-secure-shell/" mainmenuinput

sudo apt install build-essential curl git cmake htop unzip xclip ripgrep
sudo apt install fish tmux neovim yt-dlp baobab
sudo apt install golang python3

git config --global user.email "adegbijiabigail@gmail.com"
git config --global user.name "Abigail Adegbiji"
git config --global init.defaultBranch main
git config --global pull.rebase false

curl -fsSL https://bun.sh/install | bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

cd && mkdir dev && cd dev
git clone git@github.com:aabiji/muse.git
git clone git@github.com:aabiji/journal.git
git clone git@github.com:aabiji/vault.git
git clone git@github.com:aabiji/memos.git
git clone git@github.com:aabiji/dotfiles.git
git clone git@github.com:aabiji/jpeg.git
git clone git@github.com:aabiji/adventofcode.git
git clone git@github.com:aabiji/scroll.git
git clone git@github.com:aabiji/page.git
git clone git@github.com:aabiji/dstore.git
git clone git@github.com:aabiji/mnist.rs.git
git clone git@github.com:aabiji/sudoku.git
git clone git@github.com:aabiji/mark.git
git clone git@github.com:aabiji/tetris.git

mkdir archive && mkdir archive/2022 && mkdir archive/2023 && mkdir archive/2024
mv mark archive/2022 && mv tetris archive/2022
mv adventofcode archive/2023 && mv scroll archive/2023 && mv page archive/2023 && mv dstore archive/2023 && mv mnist.rs archive/2023 && mv sudoku archive/2023
mv jpeg archive/2024

cd dotfiles
mkdir ~/.config/nvim/ && cp init.lua ~/.config/nvim/init.lua
cp -r fish ~/.config
cp .tmux.conf ~/.tmux.conf

cd
echo /usr/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/bin/fish

cd dev/muse
sudo apt install libasound2-dev
cargo build --release
sudo mv target/release/muse /usr/bin/muse
cd

echo "Download some music, write .muse.conf"
echo "Setup neovim -- :PackerSync"
echo "Install chrome"
echo "Install obsidian"

sudo apt install '*video-intel*'

sudo apt update
sudo apt upgrade
