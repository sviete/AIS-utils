#!/data/data/pl.sviete.dom/files/usr/bin/bash
#   AIS
#   Homepage: https://ai-speaker.com
################################################
#  Upgrade AIS dom binary repo
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/linux/DEV2/apt_upgrade.sh | bash
#
curl http://localhost:8122/text_to_speech?text=Zmiana%20repozytorium%20AIS%20dom
echo " "
echo "Upgrade repo"
echo "# The main AI-Speaker repository:" > /data/data/pl.sviete.dom/files/usr/etc/apt/sources.list
echo "deb [trusted=yes] https://powiedz.co/apt dom stable" >> /data/data/pl.sviete.dom/files/usr/etc/apt/sources.list
echo "deb [trusted=yes] https://powiedz.co/apt python 3.9" >> /data/data/pl.sviete.dom/files/usr/etc/apt/sources.list
echo " "
apt update
echo " "
curl http://localhost:8122/text_to_speech?text=Start%20instalacji%20binarnych%20pakiet%C3%B3w
echo "APT install"
apt install -y libacl
apt install -y apt
apt install -y clang
curl http://localhost:8122/text_to_speech?text=Instaluj%C4%99%20pakiety%20j%C4%99zyka%20C
apt install -y ldc
apt remove -y python
rm -rf /data/data/pl.sviete.dom/files/usr/lib/python3.7
http://localhost:8122/text_to_speech?text=Instaluj%C4%99%20pozosta%C5%82e%20pakiety%20binarne
apt upgrade -y
apt install -y libusb
echo "Python upgrade"
curl http://localhost:8122/text_to_speech?text=Instaluj%C4%99%20pakiety%20j%C4%99zyka%20python
apt install -y python
echo "Nodejs uprgrade"
curl http://localhost:8122/text_to_speech?text=Instaluj%C4%99%20pakiety%20node%20js
apt remove -y nodejs
apt install -y nodejs-lts
echo "Fix FTP serwer"
curl http://localhost:8122/text_to_speech?text=Zmiana%20serwera%20FTP
pm2 delete ftp
pm2 start busybox --name ftp --output  /dev/null --error  /dev/null --restart-delay=150000 -- tcpsvd -vE 0.0.0.0 1024 busybox ftpd -w /sdcard
pm2 save
echo "ais-dom install"
curl http://localhost:8122/text_to_speech?text=Instalacja%20Asystenta%20domowego
pip install --upgrade pip
pip install wheel
pip install ais-dom
pip install sqlalchemy==1.3.20
echo "PM2 restart AIS"
curl http://localhost:8122/text_to_speech?text=Ponowne%20uruchomienie%20us%C5%82ugi%20Asystent%20domowy
pm2 restart ais
