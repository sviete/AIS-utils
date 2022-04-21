echo "deb [trusted=yes] https://powiedz.co/apt python-3.10 3.10" >> /data/data/pl.sviete.dom/files/usr/etc/apt/sources.list
apt update
apt install libmd
apt install openssl
apt install libicu
apt -y upgrade
npm install -g npm@8.7.0
cd ~/zigbee2mqtt/
npm rebuild
cd ~/AIS-webcmd/
npm rebuild

rm -rf /data/data/pl.sviete.dom/files/usr/lib/python3.9
apt install rust

echo "[http]" > ~/.cargo/config
echo 'cainfo = "/data/data/pl.sviete.dom/files/usr/etc/tls/cert.pem"' >> ~/.cargo/config
export CARGO_BUILD_TARGET=armv7-linux-androideabi

pip install cryptography
pip install psycopg2
pip install psutil
# install ais-dom
