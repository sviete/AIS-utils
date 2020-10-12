# set new apt repo


#
apt install libacl
apt install -y clang
apt install -y ldc
apt install apt
apt upgrade -y
apt install libusb

apt install pure-ftpd
pm2 delete ftp
pm2 start busybox --name ftp --output  /dev/null --error  /dev/null --restart-delay=150000 -- tcpsvd -vE 0.0.0.0 1024 busybox ftpd -w /sdcard

apt remove python
rm -rf python3.7
apt install python

apt remove nodejs
apt install nodejs-lts

apt install neofetch
apt install w3m


pip install ais-dom
pip install bcrypt==3.1.7
pip install sqlalchemy==1.3.19
pip install --upgrade pip
