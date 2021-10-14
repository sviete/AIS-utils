#!/data/data/pl.sviete.dom/files/usr/bin/bash
# AIS
# omepage: https://ai-speaker.com
################################################
# Install ais-dom on BETA chanel
# run it by executiong in AIS dom console:
# curl -L https://raw.githubusercontent.com/sviete/AIS-utils/master/releases/build_beta.sh | bash
#

AIS_VERSSION=2021.10.3b1
echo -e '\e[38;5;220m START bulding version \e[30;48;5;208m AIS BETA ' $AIS_VERSSION '\e[0m'
SECONDS=0
echo -e '\e[38;5;220m AIS cleenup ... \e[0m'
cd ~/AIS-home-assistant
rm -rf wheels
rm -rf beta_wheelhouse.tar.7z
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
echo ais-dom==$AIS_VERSSION >> requirements.txt

echo -e '\e[38;5;220m Packing AIS ... \e[0m'
cd ~/AIS-home-assistant
7za a -m0=lzma2 beta_wheelhouse.tar.7z wheels

echo -e '\e[38;5;220m Uploading AIS ... \e[0m'
cd ~/AIS-utils
git pull
cp ~/AIS-home-assistant/beta_wheelhouse.tar.7z releases/
git add releases/beta_wheelhouse.tar.7z
git commit -m 'beta_wheelhouse'
git push

echo -e '\e[40;38;5;220m All OK. The packaing took \e[30;48;5;208m' $SECONDS 'seconds \e[0m'