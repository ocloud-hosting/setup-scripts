source (dirname $0)/snippets/sudo-check.sh
if [ -x "$(command -v docker)" ]; then
    echo 'Docker is already installed.'
else
    echo 'Installing Docker'
    curl -sSL https://get.docker.com/ | CHANNEL=stable bash
    usermod -aG docker $USER
    systemctl enable --now docker
    echo 'Docker installed'
fi

echo "Docker installed. Next steps: install wings using ./wings-install.sh"