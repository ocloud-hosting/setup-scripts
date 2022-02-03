cleanup_and_copy() {
    rm /etc/nginx/sites-enabled/default

    if [$1 -e "ssl"]; then
        cp (dirname $0)/assets/nginx.ssl.conf /etc/nginx/sites-available/pterodactyl.conf
    fi

    if [$1 -e "nossl"]; then
        cp (dirname $0)/assets/nginx.nossl.conf /etc/nginx/sites-available/pterodactyl.conf
    fi

    sed -i 's/{{domain}}/'"$domain"'/g' /etc/nginx/sites-available/pterodactyl.conf

    sudo ln -s /etc/nginx/sites-available/pterodactyl.conf /etc/nginx/sites-enabled/pterodactyl.conf
    sudo systemctl reload nginx

    echo "Panel installed."
}

if [ -z "$1" ]; then
    echo "Please provide either ssl or nossl as an argument."
    exit 1
fi

source $(dirname $0)/snippets/sudo-check.sh

echo "What is the domain name of your panel:"
read domain

cleanup_and_copy "$1" "$domain"