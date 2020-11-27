# TODO switch this repo to stable
echo " "
echo "Change repo"
echo "# The AI-Speaker beta repository:" > /data/data/pl.sviete.dom/files/usr/etc/apt/sources.list
echo "deb [trusted=yes] https://powiedz.co/apt dom-dev beta" >> /data/data/pl.sviete.dom/files/usr/etc/apt/sources.list

#
apt install libacl
apt install -y clang
apt install -y ldc
apt install apt
apt upgrade -y
apt install libusb


pm2 delete ftp
pm2 start busybox --name ftp --output  /dev/null --error  /dev/null --restart-delay=150000 -- tcpsvd -vE 0.0.0.0 1024 busybox ftpd -w /sdcard

apt remove python
rm -rf python3.7
apt install python

apt remove nodejs
apt install nodejs-lts


pip install ais-dom
pip install bcrypt==3.1.7
pip install sqlalchemy==1.3.19
pip install --upgrade pip


# PRO only...
apt install postgresql
pip install psycopg2
mkdir -p $PREFIX/var/lib/postgresql
initdb $PREFIX/var/lib/postgresql

# start db
pg_ctl -D $PREFIX/var/lib/postgresql start
# create user ais with pass dom
createuser --superuser --pwprompt ais
# create database ha
createdb ha
# open ha database
psql ha
# stop server
pg_ctl -D $PREFIX/var/lib/postgresql stop

# start db from pm2
pm2 start postgres --name db --output  /dev/null --error  /dev/null --restart-delay=150000 -- -D /data/data/pl.sviete.dom/files/usr/var/lib/postgresql
