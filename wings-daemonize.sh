source $(dirname $0)/snippets/sudo-check.sh

cp $(dirname $0)/assets/wings.service /etc/systemd/system/wings.service
systemctl enable --now wings

echo "Wings daemonized, next steps are: install panel using ./panel-install.sh"