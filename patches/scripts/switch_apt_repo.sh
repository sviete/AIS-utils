# switch the repo - test
# fix in apt is needed!!!

curl -o "/sdcard/libandroid-support.deb" -L http://powiedz.co/apt/dists/dom/stable/binary-arm/libandroid-support_25-1_arm.deb
curl -o "/sdcard/dpkg.deb" -L http://powiedz.co/apt/dists/dom/stable/binary-arm/dpkg_1.19.7-9_arm.deb
curl -o "/sdcard/diffutils.deb" -L http://powiedz.co/apt/dists/dom/stable/binary-arm/diffutils_3.7-2_arm.deb
curl -o "/sdcard/libiconv.deb" -L http://powiedz.co/apt/dists/dom/stable/binary-arm/libiconv_1.16-2_arm.deb
curl -o "/sdcard/liblzma.deb" -L http://powiedz.co/apt/dists/dom/stable/binary-arm/liblzma_5.2.4-7_arm.deb
curl -o "/sdcard/libcap.deb" -L http://powiedz.co/apt/dists/dom/stable/binary-arm/libcap_2.2.7-1_arm.deb

rm /data/data/pl.sviete.dom/files/usr/var/lib/dpkg/info/python.prerm
apt remove -y python
rm -Rf /data/data/pl.sviete.dom/files/usr/lib/python3.6

echo "deb [trusted=yes] https://powiedz.co/apt dom stable" > /data/data/pl.sviete.dom/files/usr/etc/apt/sources.list
apt update

apt install -y bzip2
apt install -y ndk-sysroot
apt install -y gzip
apt install -y zlib
apt install -y liblzma
dpkg -i --force-all /sdcard/libiconv.deb
dpkg -i --force-all /sdcard/diffutils.deb
dpkg -i --force-all /sdcard/dpkg.deb
dpkg -i --force-all /sdcard/libandroid-support.deb

todo apt -Y
todo openssl -Y

apt install -y libcap
apt remove -y game-repo
apt remove -y science-repo
apt remove -y tor

apt update

apt install -y libcrypt
apt install -y libffi
apt install -y libxml2
apt install -y libxslt
apt install -y libzmq
pkg install -y liblzo
apt update
apt -y upgrade
apt install ttyd

todo termux-tools -Y motd

apt -y install python

# create symbolic link
# ln -s libffi.so libffi.so.6

pip install pip -U
pip install ais-dom

pm2 delete webssh
pm2 start ttyd --name webssh -- -p 8080 bash
pm2 save

pm2 restart ais
