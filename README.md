# GFK-Tunnel-RKh
Fork of [SamNet-dev/paqctl](https://github.com/SamNet-dev/paqctl)

## Installation

1. Create folder `paqctl` and paste files into it.

2. Copy the `paqctl` folder to `/opt/paqctl`:

```bash
sudo cp -r paqctl /opt/paqctl
sudo chown -R root:root /opt/paqctl
sudo chmod -R 755 /opt/paqctl
ln -s /opt/paqctl/paqctl /usr/local/bin/paqctl
```

3. Run paqctl:

```bash
paqctl
```

4. Check the service status:

```bash
systemctl status paqctl
```

## Copy VPS to VPS

To copy the `paqctl` folder to another VPS:

```bash
scp -r /opt/paqctl root@ip_Destination:/opt/
```

## Timer to Restart Service (Iran VPS)

Create a systemd service to restart `paqctl` every 5 minutes.

### 1. Create the service file:

```bash
sudo nano /etc/systemd/system/paqctl-restart.service
```

Paste the following:

```ini
[Unit]
Description=Restart paqctl service every 5 minutes

[Service]
Type=oneshot
ExecStart=/bin/systemctl restart paqctl
```

### 2. Create the timer file:

```bash
sudo nano /etc/systemd/system/paqctl-restart.timer
```

Paste the following:

```ini
[Unit]
Description=Timer to restart paqctl every 5 minutes

[Timer]
OnBootSec=5min
OnUnitActiveSec=5min
Unit=paqctl-restart.service

[Install]
WantedBy=timers.target
```

### 3. Enable and start the timer:

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now paqctl-restart.timer
sudo systemctl status paqctl-restart.timer
```

### 4. View logs:

```bash
journalct
