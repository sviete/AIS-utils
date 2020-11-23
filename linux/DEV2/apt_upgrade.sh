#!/data/data/pl.sviete.dom/files/usr/bin/bash
#   AIS
#   Homepage: https://ai-speaker.com
################################################
#  Upgrade AIS dom binary repo
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/linux/DEV2/apt_upgrade.sh | bash
#
curl GET http://localhost:8122/text_to_speech?text=Zmiana repozytorium AIS dom
echo " "
echo "Upgrade repo"
echo "# The main AI-Speaker repository:" > /data/data/pl.sviete.dom/files/usr/etc/apt/sources.list
echo "deb [trusted=yes] https://powiedz.co/apt dom stable" >> /data/data/pl.sviete.dom/files/usr/etc/apt/sources.list
echo "deb [trusted=yes] https://powiedz.co/apt python 3.9" >> /data/data/pl.sviete.dom/files/usr/etc/apt/sources.list
echo " "
apt update
apt install libacl
echo " "
curl GET http://localhost:8122/text_to_speech?text=Start instalacji binarnych pakietów
echo "APT install"
apt install -y apt
apt install -y clang
apt install -y ldc
apt upgrade -y
apt install -y libusb
echo "Fix FTP serwer"
curl GET http://localhost:8122/text_to_speech?text=Zmiana serwera FTP
pm2 delete ftp
pm2 start busybox --name ftp --output  /dev/null --error  /dev/null --restart-delay=150000 -- tcpsvd -vE 0.0.0.0 1024 busybox ftpd -w /sdcard
pm2 save
echo "Python upgrade"
curl GET http://localhost:8122/text_to_speech?text=Aktualizacja python do wersji 3.9
apt remove python
rm -rf /data/data/pl.sviete.dom/files/usr/lib/python3.7
apt install python
echo "Nodejs uprgrade"
curl GET http://localhost:8122/text_to_speech?text=Zmiana wersji nodejs na LTS
apt remove nodejs
apt install nodejs-lts
echo "ais-dom install"
curl GET http://localhost:8122/text_to_speech?text=Instalacja Asystenta domowego
pip install --upgrade pip
pip install ais-dom
pip install bcrypt==3.1.7
pip install sqlalchemy==1.3.19
echo "PM2 restart AIS"
curl GET http://localhost:8122/text_to_speech?text=Ponowne uruchomienie usługi Asystent domowy
pm2 restart ais
