#!/data/data/pl.sviete.dom/files/usr/bin/bash
# AIS
# omepage: https://ai-speaker.com
################################################
# Install ais-dom on PRE-ALPHA chanel
# run it by executiong in AIS dom console:
# curl -L https://raw.githubusercontent.com/sviete/AIS-utils/master/releases/build_pre_alfa.sh | bash
#

# AIS VERSIONS
AIS_HA_VERSSION=2021.10.5b0
# AIS VERSIONS

echo -e '\e[38;5;220m START bulding version \e[30;48;5;208m AIS PRE ALFA ' $AIS_HA_VERSSION '\e[0m'
SECONDS=0
echo -e '\e[38;5;220m AIS cleenup ... \e[0m'
cd ~/AIS-home-assistant
rm -rf wheels
rm -rf pre_alfa_wheelhouse.tar.7z
echo -e '\e[38;5;220m Download AIS codes ... \e[0m'
git checkout beta
git pull

echo -e '\e[38;5;220m Building AIS wheels ... \e[0m'
export CRYPTOGRAPHY_DONT_BUILD_RUST=1
pip wheel . -w wheels
pip wheel python-miio==0.5.8 -w wheels
cp requirements.txt wheels
cd wheels
rename cp39-cp39-linux_armv7l py3-none-any *
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
git commit -m 'pre_alfa_wheelhouse $AIS_HA_VERSSION'
git push

echo -e '\e[40;38;5;220m All OK. The packaing took \e[30;48;5;208m' $SECONDS 'seconds \e[0m'
