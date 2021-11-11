#!/data/data/pl.sviete.dom/files/usr/bin/bash
# AIS
# omepage: https://ai-speaker.com
################################################
# Install ais-dom on ALPHA chanel
# run it by executiong in AIS dom console:
# curl -L https://raw.githubusercontent.com/sviete/AIS-utils/master/releases/bump_alfa_version.sh | bash
#

# AIS VERSIONS
AIS_HA_VERSSION=2021.11.2b2
# AIS VERSIONS

echo -e '\e[38;5;220m START preparing version \e[30;48;5;208m AIS ALFA ' $AIS_HA_VERSSION '\e[0m'
SECONDS=0

if [ -d "~/AIS-utils" ]
then
    echo -e '\e[38;5;220m AIS repo exists \e[0m'
else
    echo -e '\e[38;5;220m Clone AIS repo ... \e[0m'
    cd ~
    git clone --depth 1 https://github.com/sviete/AIS-utils.git
fi


echo -e '\e[38;5;220m Uploading AIS to github... \e[0m'
cd ~/AIS-utils
git pull
cp releases/pre_alfa_wheelhouse.tar.7z releases/alfa_wheelhouse.tar.7z
git add releases/alfa_wheelhouse.tar.7z
git commit -m 'alfa_wheelhouse ' $AIS_HA_VERSSION
git push

# TODO call AIS WS to inform about new version

echo -e '\e[40;38;5;220m All OK. The releasing took \e[30;48;5;208m' $SECONDS 'seconds \e[0m'
