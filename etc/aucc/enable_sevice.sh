set -e

if [ `id -u` -ne 0 ]; then
    echo "Necessites permisos de superusuari"
    exit 1
fi

AUCC_SERVICE="/etc/systemd/system/aucc.service"
cp aucc.service $AUCC_SERVICE
echo "Copied aucc.service to $AUCC_SERVICE"

# give permissions
chmod 755 $AUCC_SERVICE

systemctl enable aucc.service # enable service
systemctl daemon-reload # reload daemon for apply changes
systemctl start aucc.service # start service
systemctl status aucc.service #check status
