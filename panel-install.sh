source $(dirname $0)/snippets/sudo-check.sh

echo 'Installing dependencies'
apt -y install software-properties-common curl apt-transport-https ca-certificates gnupg
LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
apt update
apt-add-repository universe
apt -y install php8.0 php8.0-{cli,gd,mysql,pdo,mbstring,tokenizer,bcmath,xml,fpm,curl,zip} tar unzip git nginx
echo 'Installing composer'
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
echo 'Installing panel'
mkdir -p /var/www/pterodactyl
cd /var/www/pterodactyl
curl -Lo panel.tar.gz https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz
tar -xzvf panel.tar.gz
chmod -R 755 storage/* bootstrap/cache/
chown -R www-data:www-data /var/www/pterodactyl/*
echo 'Finished installing panel'
echo 'Please visit https://pterodactyl.io/panel/1.0/getting_started.html#installation to finish setting up your panel. (you will need to install MariaDB/MySQL, but not redis. Also run ./panel-crontabs.sh then ./panel-nginx-conf.sh'