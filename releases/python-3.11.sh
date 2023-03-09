apt update
apt -y upgrade

rm -rf /data/data/com.termux/files/usr/lib/python3.10

apt install rust

export CARGO_BUILD_TARGET=armv7-linux-androideabi
export RUSTFLAGS+=" -C lto=no"

pip install aisapi
pip install cryptography
pip install orjson
pip install setuptools
pip install lru-dict
pip install bcrypt
pip install ciso8601
pip install psutil
MATHLIB="m" pip install numpy==1.23.2
