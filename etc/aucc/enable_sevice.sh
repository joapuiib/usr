cp aucc.service /etc/systemd/system/aucc.service

# give permissions
chmod 755 /etc/systemd/system.aucc.service 

systemctl enable aucc.service # enable service
systemctl daemon-reload # reload daemon for apply changes
systemctl start aucc.service # start service
systemctl status aucc.service #check status
