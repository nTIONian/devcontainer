##!/bin/sh

set -e

echo "Running user-setup.sh"

GITHUB_USERNAME="${GITHUB_USERNAME:-defaultuser}"

echo "Creating user: $GITHUB_USERNAME"

adduser -D "$GITHUB_USERNAME"
echo "$GITHUB_USERNAME ALL=(ALL) NOPASSWD: ALL" >/etc/sudoers.d/"$GITHUB_USERNAME" && chmod 0440 /etc/sudoers.d/"$GITHUB_USERNAME"

echo "Installing lazyzim"

git clone https://github.com/LazyVim/starter /home/"$GITHUB_USERNAME"/.config/nvim
rm -rf /home/"$GITHUB_USERNAME"/.config/nvim/.git
chown -R "$GITHUB_USERNAME":"$GITHUB_USERNAME" /home/"$GITHUB_USERNAME"/.config/nvim

echo "Installing oh-my-bash"

OSH_THEME="rr"
sudo -u "$GITHUB_USERNAME" bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended
sudo -u "$GITHUB_USERNAME" sed -i "s/OSH_THEME=\".*\"/OSH_THEME=\"$OSH_THEME\"/" /home/"$GITHUB_USERNAME"/.bashrc
sudo chsh -s "/bin/bash" "$GITHUB_USERNAME"

echo "Done!"
