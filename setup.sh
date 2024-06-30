sudo apt install tmux gnome-tweaks vim git cloc python3-pip build-essential curl zsh yt-dlp

# Setup package manager for vscode
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg 

# Setup package manager for gh
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt update

sudo apt install code && sudo apt install gh

curl -fsSL https://bun.sh/install | bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

curl -LsSf https://astral.sh/uv/install.sh | sh


sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Install google-chrome"
echo "Install JetBrains Mono and Monaspace font"

sudo snap install vlc
sudo snap install obsidian --classic

ssh-keygen
gh auth login
gh repo list aabiji --limit 4000 | while read -r repo _; do
    gh repo clone "$repo" "$repo"
done

sudo apt update && sudo apt upgrade
sudo apt autoremove

python3 update-configs.py
