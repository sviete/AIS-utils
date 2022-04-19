echo "deb [trusted=yes] https://powiedz.co/apt python-3.10 3.10" >> /data/data/pl.sviete.dom/files/usr/etc/apt/sources.list
apt update
apt install libmd
apt install openssl
apt install libicu
cd ~/zigbee2mqtt/
npm rebuild
