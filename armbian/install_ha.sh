#!/bin/bash
# AIS
# omepage: https://ai-speaker.com
################################################
# Install Home Assistant Supervised on Armbian
# run it by executiong in Armbian console:
# curl -L https://raw.githubusercontent.com/sviete/AIS-utils/master/armbian/install_ha.sh | bash
#
echo "add kernel boot parameters"
sed -i '$ s/$/ systemd.unified_cgroup_hierarchy=0 apparmor=1 security=apparmor/' /boot/uEnv.txt

echo "fix DNS resolving"
echo "nameserver 80.80.80.80" >> /etc/resolv.conf


echo "install apt packages"
apt update
apt upgrade -y
apt install \
apparmor \
jq \
wget \
curl \
udisks2 \
libglib2.0-bin \
network-manager \
dbus \
lsb-release \
systemd-journal-remote \
systemd-resolved \
udisks2 -y

echo "install docker"
curl -fsSL get.docker.com | sh

echo "install os-agent"
curl -L https://github.com/home-assistant/os-agent/releases/download/1.5.1/os-agent_1.5.1_linux_aarch64.deb -o os-agent_1.5.1_linux_aarch64.deb
dpkg -i ./os-agent_1.5.1_linux_aarch64.deb

echo "install homeassistant-supervised"
sed -i 's#PRETTY_NAME=.*#PRETTY_NAME="Debian GNU/Linux 11 (bullseye)"#'  /etc/os-release
wget https://github.com/home-assistant/supervised-installer/releases/latest/download/homeassistant-supervised.deb
# dpkg -i homeassistant-supervised.deb

echo "enable services"
# sudo systemctl enable hassio-apparmor.service
# sudo systemctl enable hassio-supervisor.service

# Create image from USB
# sudo sh -c "dd if=/dev/sda status=progress | xz -c > ~/armbian.img.xz"
