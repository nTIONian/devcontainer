##!/bin/sh

set -e

echo "Running user-setup.sh"

GITHUB_USER="${GITHUB_USER:-defaultuser}"

echo "Creating user: $GITHUB_USER"

adduser -D "$GITHUB_USER"
echo "$GITHUB_USER ALL=(ALL) NOPASSWD: ALL" >/etc/sudoers.d/"$GITHUB_USER" && chmod 0440 /etc/sudoers.d/"$GITHUB_USER"

echo "Installing lazyzim"

git clone https://github.com/LazyVim/starter /home/"$GITHUB_USER"/.config/nvim
rm -rf /home/"$GITHUB_USER"/.config/nvim/.git
chown -R "$GITHUB_USER":"$GITHUB_USER" /home/"$GITHUB_USER"/.config/nvim

echo "Installing oh-my-bash"

OSH_THEME="rr"
sudo -u "$GITHUB_USER" bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended
sudo -u "$GITHUB_USER" sed -i "s/OSH_THEME=\".*\"/OSH_THEME=\"$OSH_THEME\"/" /home/"$GITHUB_USER"/.bashrc
sudo chsh -s "/bin/bash" "$GITHUB_USER"

echo "Done!"
