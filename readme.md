# Install

```sh
sudo snap install nvim --classic
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
npm install -g intelephense eslint pyright typescript typescript-language-server @angular/language-server prettier vscode-langservers-extracted
sudo snap install go --classic
go install golang.org/x/tools/gopls@latest
go install github.com/jesseduffield/lazygit@latest
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer
sudo apt install build-essential clangd codeblocks gdb manpages-dev lua-language-server python3 python3-pip ripgrep valgrind viu w3m
pip install debugpy ueberzug
composer global require friendsofphp/php-cs-fixer
```
