# GFK-Tunnel-RKh
Fork SamNet-dev/paqctl

copy "paqctl" folder to /opt/paqctl
sudo chown -R root:root /opt/paqctl
sudo chmod -R 755 /opt/paqctl
ln -s /opt/paqctl/paqctl /usr/local/bin/paqctl
run: paqctl
systemctl status paqctl

For Copy VPS to VPS:
scp -r /opt/paqctl root@ip_Destination:/opt/
----------------------------------------------------
**timer restart service (iran VPS):
**
nano /etc/systemd/system/paqctl-restart.service

[Unit]
Description=Restart paqctl service every 5 minutes

[Service]
Type=oneshot
ExecStart=/bin/systemctl restart paqctl


nano /etc/systemd/system/paqctl-restart.timer

[Unit]
Description=Timer to restart paqctl every 5 minutes

[Timer]
OnBootSec=5min
OnUnitActiveSec=5min
Unit=paqctl-restart.service

[Install]
WantedBy=timers.target


sudo systemctl daemon-reload
sudo systemctl enable --now paqctl-restart.timer
sudo systemctl status paqctl-restart.timer

journalctl -u paqctl-restart.service -f
