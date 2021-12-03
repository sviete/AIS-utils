#
# AIS
# homepage: https://ai-speaker.com
################################################
# Bump version on AIS ALPHA chanel
# run it by executiong in AIS dom console:
# curl -L https://raw.githubusercontent.com/sviete/AIS-utils/master/releases/bump_alfa_version.sh | bash
#

echo -e '\e[38;5;220m START przygotowania nowej wersji na kanale \e[30;48;5;208m AIS ALFA \e[0m'
SECONDS=0

if [ -d ~/AIS-utils ]
then
    echo -e '\e[38;5;220m OK repozytorium istnieje \e[0m'
else
    echo -e '\e[38;5;220m Klonowanie repozytorium ... \e[0m'
    cd ~
    git clone --depth 1 https://github.com/sviete/AIS-utils.git
    cd ~/AIS-utils
    git config user.email "stravinci@gmail.com"
    git config user.name "stravinci"
fi

echo -e '\e[38;5;220m Przygotowanie skryptu instalacji wersji... \e[0m'
cd ~/AIS-utils
git pull
cp releases/pre_alfa.sh releases/alfa.sh
sed -i "s/pre_alfa/alfa/" releases/alfa.sh
sed -i "s/pre_alfa/alfa/" releases/alfa.sh
sed -i "s/PRE ALFA/ALFA/" releases/alfa.sh
git commit -m 'bump alfa script'
git add releases/alfa.sh

echo -e '\e[38;5;220m Wysyłanie wersji do Github... \e[0m'

cp releases/pre_alfa_wheelhouse.tar.7z releases/alfa_wheelhouse.tar.7z
cp releases/zigbee_pre_alfa.zip releases/zigbee_alfa.zip
git add releases/alfa_wheelhouse.tar.7z
git add releases/zigbee_alfa.zip
git commit -m 'bump alfa version'
git push

echo -e '\e[38;5;220m Wysyłanie informacji o nowej wersji do serwisu AIS... \e[0m'

echo -n AIS AUTH token:
read AUTH
curl -d '{"branch":"alfa"}' -H "Content-Type: application/json" -H "Authorization: Bearer $AUTH" -X POST  https://powiedz.co/ords/dom/dom/bump_version


echo -e '\e[40;38;5;220m Koniec, skrypt trwał \e[30;48;5;208m' $SECONDS ' sekund \e[0m'
