# TODO daemonize
echo 'apt update' > /data/data/com.termux/files/home/AIS/ais_daemonize.sh
echo 'apt -y -o Dpkg::Options::="--force-confnew" upgrade' >> /data/data/com.termux/files/home/AIS/ais_daemonize.sh
echo 'apt -y autoremove' >> /data/data/com.termux/files/home/AIS/ais_daemonize.sh
echo 'rm -rf /data/data/com.termux/files/usr/lib/python3.10' >> /data/data/com.termux/files/home/AIS/ais_daemonize.sh

# TODO remove this
apt install -y rust
export CARGO_BUILD_TARGET=armv7-linux-androideabi
export RUSTFLAGS+=" -C lto=no"

# TODO replace this by:
# curl -o "/data/data/com.termux/files/home/AIS/pre_alfa_wheelhouse.tar.7z" -# -L  https://github.com/sviete/AIS-utils/blob/master/releases/pre_alfa_wheelhouse.tar.7z?raw=true
# 7z x -mmt=2 -o/data/data/com.termux/files/home/AIS/ /data/data/com.termux/files/home/AIS/pre_alfa_wheelhouse.tar.7z -y
# pip install -r wheels/requirements.txt --no-index --find-links=wheels -U
pip install setuptools
pip install aisapi
pip install psutil
pip install tzdata
MATHLIB="m" pip install numpy==1.23.2
pip install ais-dom


chmod +x /data/data/com.termux/files/home/AIS/ais_daemonize.sh
daemonize /data/data/com.termux/files/home/AIS/ais_daemonize.sh