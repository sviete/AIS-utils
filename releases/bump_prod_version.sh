#
# AIS
# homepage: https://ai-speaker.com
################################################
# Bump version on AIS ALPHA chanel
# run it by executiong in AIS dom console:
# curl -L https://raw.githubusercontent.com/sviete/AIS-utils/master/releases/bump_prod_version.sh | bash
#

echo -e '\e[38;5;220m START przygotowania nowej wersji na kanale \e[30;48;5;208m AIS PROD \e[0m'
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
cp releases/beta.sh releases/prod.sh
sed -i "s/beta/prod/" releases/prod.sh
sed -i "s/beta/prod/" releases/prod.sh
sed -i "s/BETA/PROD/" releases/prod.sh
sed -i "s/ais-dom-update-prod/ais-dom-update/" releases/prod.sh

git commit -m 'bump prod script'
git add releases/prod.sh

echo -e '\e[38;5;220m Wysyłanie wersji do Github... \e[0m'

cp releases/beta_wheelhouse.tar.7z releases/prod_wheelhouse.tar.7z
cp releases/zigbee_beta.zip releases/zigbee_prod.zip
git add releases/prod_wheelhouse.tar.7z
git add releases/zigbee_prod.zip
git commit -m 'bump prod version'
git push

echo -e '\e[38;5;220m Wysyłanie informacji o nowej wersji do serwisu AIS... \e[0m'

echo -n AIS AUTH token:
read AUTH
curl -d '{"branch":"prod"}' -H "Content-Type: application/json" -H "Authorization: Bearer $AUTH" -X POST  https://powiedz.co/ords/dom/dom/bump_version


echo -e '\e[40;38;5;220m Koniec, skrypt trwał \e[30;48;5;208m' $SECONDS ' sekund \e[0m'
