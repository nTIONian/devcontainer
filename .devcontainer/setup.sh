#!/bin/sh

set -e

echo "Running setup.sh"
echo "Installing basic packages"

apk --no-cache update
apk --no-cache add openrc sudo build-base git curl htop go python3 make nodejs postgresql-client openssh-server-pam neovim ripgrep fd lazygit bash unzip wget gzip shadow

echo "Setting up ssh server"

ssh-keygen -A
mkdir /run/openrc
touch /run/openrc/softlevel
sed -i -E "s/#*\s*Port\s+.+/Port 2222/g" /etc/ssh/sshd_config
sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/#GatewayPorts no/GatewayPorts yes/g' /etc/ssh/sshd_config
sed -i 's/#PermitTunnel no/PermitTunnel yes/g' /etc/ssh/sshd_config
sed -i -E "s/#?\s*UsePAM\s+.+/UsePAM yes/g" /etc/ssh/sshd_config
rc-status
service sshd start
