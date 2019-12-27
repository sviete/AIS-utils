# switch the repo - test
# fix in apt is needed!!!

echo "Download debs"
curl -o "/sdcard/libandroid-support.deb" -L http://powiedz.co/apt/dists/dom/stable/binary-arm/libandroid-support_25-1_arm.deb
curl -o "/sdcard/dpkg.deb" -L http://powiedz.co/apt/dists/dom/stable/binary-arm/dpkg_1.19.7-9_arm.deb
curl -o "/sdcard/diffutils.deb" -L http://powiedz.co/apt/dists/dom/stable/binary-arm/diffutils_3.7-2_arm.deb
curl -o "/sdcard/libiconv.deb" -L http://powiedz.co/apt/dists/dom/stable/binary-arm/libiconv_1.16-2_arm.deb
curl -o "/sdcard/coreutils.deb" -L  http://powiedz.co/apt/dists/dom/stable/binary-arm/coreutils_8.31-7_arm.deb
echo " "
echo "Remove Python"
rm /data/data/pl.sviete.dom/files/usr/var/lib/dpkg/info/python.prerm
apt remove -y python
rm -Rf /data/data/pl.sviete.dom/files/usr/lib/python3.6

echo " "
echo "Change repo"
echo "deb [trusted=yes] https://powiedz.co/apt dom stable" > /data/data/pl.sviete.dom/files/usr/etc/apt/sources.list

echo " "
echo "apt update"
apt update
apt install -y gzip
apt install -y bzip2
apt install -y ndk-sysroot
apt install -y zlib
apt install -y liblzma
apt install -y libcrypt
apt install -y libffi
apt install -y libzmq
apt install -y liblzo
apt install -y libcap
apt install -y libxslt
apt install -y clang

echo " "
echo "dpkg force"

dpkg -i --force-all /sdcard/coreutils.deb

# TERMUX_PKG_REPLACES="libandroid-support (<= 24), libiconv-dev"
dpkg -i --force-all /sdcard/libiconv.deb

dpkg -i --force-all /sdcard/diffutils.deb

# TERMUX_PKG_REPLACES="dpkg-dev"
dpkg -i --force-all /sdcard/dpkg.deb

dpkg -i --force-all /sdcard/libandroid-support.deb

echo " "
echo "apt install"
apt install -y libpsl
apt install -y libxml2


echo " "
echo "apt force-confnew"
apt install -y -o Dpkg::Options::=--force-confnew apt
apt install -y -o Dpkg::Options::=--force-confnew openssl
apt install -y -o Dpkg::Options::=--force-confnew termux-tools
apt install -y -o Dpkg::Options::=--force-confnew bash.bashrc
apt install -y -o Dpkg::Options::=--force-confnew openssh

echo " "
echo "apt remove tor"
apt remove -y tor


apt update
apt -y upgrade
apt -y install ttyd
apt -y install python

pip install pip -U
pip install ais-dom
pip install distro==1.4.0
pip install spotipy-homeassistant==2.4.4.dev1
pip install pypng==0.0.18


# pm2 restart ais
pm2 delete ais
pm2 delete webssh
pm2 delete ftp
pm2 delete mqtt
pm2 start hass --name ais --output NULL --error NULL --interpreter=python --restart-delay=30000 -- --config /data/data/pl.sviete.dom/files/home/AIS
pm2 start ttyd --name webssh --output NULL --error NULL --restart-delay=30000 -- -p 8888 bash
pm2 start tcpsvd --name ftp --output NULL --error NULL --restart-delay=30000 -- -vE 0.0.0.0 1024 ftpd -w /sdcard
pm2 start mosquitto --name mqtt --output NULL --error NULL --restart-delay=30000 -- -c /data/data/pl.sviete.dom/files/usr/etc/mosquitto/mosquitto.conf


pm2 save
