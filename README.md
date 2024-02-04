# Setup

Steps to install and ensure automatic updates using systemd-sysupdate:

```
curl -L https://github.com/mback2k/sysext-qemu-ga/releases/latest/download/sysupdate-noop.conf --create-dirs -o /etc/sysupdate.d/noop.conf
curl -L https://github.com/mback2k/sysext-qemu-ga/releases/latest/download/sysupdate-qemu-ga.conf --create-dirs -o /etc/sysupdate.qemu-ga.d/qemu-ga.conf
curl -L https://github.com/mback2k/sysext-qemu-ga/releases/latest/download/systemd-qemu-ga.conf --create-dirs -o /etc/systemd/system/systemd-sysupdate.service.d/qemu-ga.conf
curl -L https://github.com/mback2k/sysext-qemu-ga/releases/latest/download/systemd-sysext.conf --create-dirs -o /etc/systemd/system/systemd-sysupdate.service.d/sysext.conf
systemctl daemon-reload
systemctl enable systemd-sysupdate.timer
systemctl start systemd-sysupdate.service
```
