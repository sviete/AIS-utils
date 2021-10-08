#!/data/data/pl.sviete.dom/files/usr/bin/bash
# AIS
# omepage: https://ai-speaker.com
################################################
# Install ais-dom on ALPHA chanel
# run it by executiong in AIS dom console:
# curl -L https://raw.githubusercontent.com/sviete/AIS-utils/master/releases/pre_alfa.sh | bash
#


echo -e '\e[38;5;220m START instalacji wersji \e[30;48;5;208m AIS PRE ALFA \e[0m'
curl http://localhost:8122/text_to_speech?text=Start%20instalacji%20wersji%AIS%20ALFA
sleep 5

curl -o ~/AIS/logo.txt -L https://raw.githubusercontent.com/sviete/AIS-utils/master/releases/logo.txt
apt install -y w3m
apt install -y neofetch

neofetch --source  ~/AIS/logo.txt

SECONDS=0
echo -e '\e[38;5;220m Pobieram AIS ... \e[0m'
curl http://localhost:8122/text_to_speech?text=Pobieram%20AIS
curl -o "/data/data/pl.sviete.dom/files/home/AIS/pre_alfa_wheelhouse.tar.7z" -L  https://github.com/sviete/AIS-utils/blob/master/releases/pre_alfa_wheelhouse.tar.7z?raw=true

echo -e '\e[38;5;220m Rozpakowuje AIS ... \e[0m'
curl http://localhost:8122/text_to_speech?text=Rozpakowuje%20AIS
7z x -mmt=2 -o/data/data/pl.sviete.dom/files/home/AIS/ /data/data/pl.sviete.dom/files/home/AIS/pre_alfa_wheelhouse.tar.7z -y

echo -e '\e[38;5;220m Instaluje AIS ... \e[0m'
curl http://localhost:8122/text_to_speech?text=Instaluje%20AIS
cd /data/data/pl.sviete.dom/files/home/AIS
pip install -r wheels/requirements.txt --no-index --find-links wheels -U
rm -rf /data/data/pl.sviete.dom/files/home/AIS/wheels
rm -rf /data/data/pl.sviete.dom/files/home/AIS/pre_alfa_wheelhouse.tar.7z


if  grep -q '"version": "1.21.2",' '/data/data/pl.sviete.dom/files/home/zigbee2mqtt/package.json' ; then
  echo -e '\e[38;5;220m Zigbee OK... \e[0m'
else
  echo -e '\e[38;5;220m Pobieram Zigbee ... \e[0m'
  curl http://localhost:8122/text_to_speech?text=Pobieram%20Zigbee
  curl -H 'Cache-Control: no-cache' -o "/data/data/pl.sviete.dom/files/home/AIS/zigbee_update.zip" -L http://powiedz.co/ota/zigbee_beta.zip
  cp -R /data/data/pl.sviete.dom/files/home/zigbee2mqtt/data /data/data/pl.sviete.dom/files/home/data-backup
  rm -rf /data/data/pl.sviete.dom/files/home/zigbee2mqtt

  echo -e '\e[38;5;220m Rozpakowuje Zigbee ... \e[0m'
  curl http://localhost:8122/text_to_speech?text=Rozpakowuje%20Zigbee
  7z x -mmt=2 -o/data/data/pl.sviete.dom/files/home/zigbee2mqtt /data/data/pl.sviete.dom/files/home/AIS/zigbee_update.zip -y
  rm -rf /data/data/pl.sviete.dom/files/home/AIS/zigbee_update.zip
  cp -R /data/data/pl.sviete.dom/files/home/data-backup/* /data/data/pl.sviete.dom/files/home/zigbee2mqtt/data
  rm -rf /data/data/pl.sviete.dom/files/home/data-backup
fi



echo -e '\e[40;38;5;220m Wszystko OK. Instalacja trwała \e[30;48;5;208m' $SECONDS 'sekund \e[0m'
curl http://localhost:8122/text_to_speech?text=Instalacja%20trwa%C5%82a%20$SECONDS%20sekund.%20Poczekaj%20na%20ponowne%20uruchomienie%20systemu.

echo "21.10.01" > /data/data/pl.sviete.dom/files/home/AIS/.ais_apt

sleep 6
echo -e '\e[38;5;220m Restartuje usługę ais ... \e[0m'
curl http://localhost:8122/text_to_speech?text=Restartuje%20us%C5%82ug%C4%99%20AIS
pm2 restart ais
