#!/bin/sh

set -e

echo "Running user-setup.sh"
echo "Installing lazyzim"

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

echo "Installing oh-my-bash"

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended
sed -i 's/OSH_THEME=".*"/OSH_THEME="rr"/' ~/.bashrc
sudo chsh -s "/bin/bash" "$(whoami)"

echo "Done!"
