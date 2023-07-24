#!/data/data/com.termux/files/usr/bin/bash
# AIS
# omepage: https://ai-speaker.com
################################################
# Build ais-dom for PRE-ALPHA chanel
# run it by executiong in AIS dom console:
# curl -L https://raw.githubusercontent.com/sviete/AIS-utils/master/releases/build_pre_alfa.sh | bash
#

echo -e '\e[38;5;220m Script version 2023.07.24.0 \e[0m'

# AIS VERSIONS
AIS_HA_VERSSION=2023.7.3
AIS_FRONTEND_VERSSION=20230705.2
# AIS VERSIONS

cd ~

if [ -d ~/AIS-home-assistant ]
then
    echo -e '\e[38;5;220m OK AIS-home-assistant repo exists \e[0m'
else
    echo -e '\e[38;5;220m Clone AIS-home-assistant repo ... \e[0m'
    git clone -b alfa --depth 1 https://github.com/sviete/AIS-home-assistant.git
fi

if [ -d ~/AIS-utils ]
then
    echo -e '\e[38;5;220m OK AIS-utils repo exists \e[0m'
else
    echo -e '\e[38;5;220m Clone AIS-utils repo ... \e[0m'
    cd ~
    git clone --depth 1 https://github.com/sviete/AIS-utils.git
fi

echo -e '\e[38;5;220m START bulding version \e[30;48;5;208m AIS PRE ALFA ' $AIS_HA_VERSSION '\e[0m'
SECONDS=0

echo -e '\e[38;5;220m AIS cleenup ... \e[0m'
cd ~/AIS-home-assistant
rm -rf wheels
rm -rf pre_alfa_wheelhouse.tar.7z
rm -rf build

echo -e '\e[38;5;220m Download AIS codes ... \e[0m'
git checkout alfa
git pull

echo -e '\e[38;5;220m Rust ... \e[0m'
rustc -vV

echo -e '\e[38;5;220m Building AIS wheels ... \e[0m'
pip wheel --no-cache-dir . -w wheels
pip wheel --no-cache-dir ais-dom-frontend==$AIS_FRONTEND_VERSSION -w wheels
pip wheel --no-cache-dir python-miio==0.5.12 -w wheels
pip wheel --no-cache-dir Pillow==9.5.0 -w wheels
pip wheel --no-cache-dir PyNaCl==1.5.0 -w wheels
pip wheel --no-cache-dir aisapi==0.1.1 -w wheels
pip wheel --no-cache-dir botocore==1.31.2 -w wheels
pip wheel --no-cache-dir setuptools==68.0.0 -w wheels
pip wheel --no-cache-dir tzdata==2023.3 -w wheels
pip wheel --no-cache-dir psutil==5.9.5 -w wheels
pip wheel --no-cache-dir zeroconf==0.70.0 -w wheels
pip wheel --no-cache-dir hassil==1.0.6 -w wheels
pip wheel --no-cache-dir home-assistant-intents==2023.6.28 -w wheels
MATHLIB=m CFLAGS+=" -Wno-implicit-function-declaration" pip wheel --no-cache-dir numpy==1.23.2 -w wheels
cp requirements.txt wheels
cd wheels
rename cp311-cp311-linux_armv7l py3-none-any *
sed -i '1d' requirements.txt
echo \ >> requirements.txt
echo ais-dom==$AIS_HA_VERSSION >> requirements.txt

echo -e '\e[38;5;220m Packing AIS ... \e[0m'
cd ~/AIS-home-assistant
7za a -m0=lzma2 pre_alfa_wheelhouse.tar.7z wheels

echo -e '\e[38;5;220m Uploading AIS ... \e[0m'
cd ~/AIS-utils
git pull
cp ~/AIS-home-assistant/pre_alfa_wheelhouse.tar.7z releases/
git add releases/pre_alfa_wheelhouse.tar.7z
git commit -m pre_alfa_wheelhouse -m $AIS_HA_VERSSION
git push

echo -e '\e[40;38;5;220m All OK. The packaing took \e[30;48;5;208m' $SECONDS 'seconds \e[0m'
