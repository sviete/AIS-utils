#!/data/data/pl.sviete.dom/files/usr/bin/bash
# AIS
# omepage: https://ai-speaker.com
################################################
# Install ais-dom 2021.10...
# run it by executiong in AIS dom console:
# curl -L https://raw.githubusercontent.com/sviete/AIS-utils/master/releases/2021/ais-dom==2021.10.sh | bash
#


echo -e '\e[40;38;5;82m START instalacji wersji \e[30;48;5;82m AIS 2021.10 \e[0m'
curl http://localhost:8122/text_to_speech?text=Start%20instalacji%20wersji%202021.10
sleep 5

SECONDS=0
echo -e '\e[38;5;11m Pobieram AIS ... \e[0m'
curl http://localhost:8122/text_to_speech?text=Pobieram%20AIS
curl -o "/data/data/pl.sviete.dom/files/home/AIS/2021.10_wheelhouse.tar.7z" -L  https://github.com/sviete/AIS-utils/blob/master/releases/2021/2021.10_wheelhouse.tar.7z?raw=true

echo -e '\e[38;5;214m Rozpakowuje AIS ... \e[0m'
curl http://localhost:8122/text_to_speech?text=Rozpakowuje%20AIS
7z x -mmt=2 -o/data/data/pl.sviete.dom/files/home/AIS/ /data/data/pl.sviete.dom/files/home/AIS/2021.10_wheelhouse.tar.7z -y

echo -e '\e[38;5;202m Instaluje AIS ... \e[0m'
curl http://localhost:8122/text_to_speech?text=Instaluje%20AIS
cd /data/data/pl.sviete.dom/files/home/AIS
pip install -r wheels/requirements.txt --no-index --find-links wheels/


echo -e '\e[38;5;11m Pobieram Zigbee ... \e[0m'
curl http://localhost:8122/text_to_speech?text=Pobieram%20Zigbee
curl -o "/data/data/pl.sviete.dom/files/home/AIS/zigbee_update.zip" -L http://powiedz.co/ota/zigbee_beta.zip
cp -R /data/data/pl.sviete.dom/files/home/zigbee2mqtt/data /data/data/pl.sviete.dom/files/home/data-backup
rm -rf /data/data/pl.sviete.dom/files/home/zigbee2mqtt

echo -e '\e[38;5;214m Rozpakowuje Zigbee ... \e[0m'
curl http://localhost:8122/text_to_speech?text=Rozpakowuje%20Zigbee
7z x -mmt=2 -o/data/data/pl.sviete.dom/files/home/zigbee2mqtt /data/data/pl.sviete.dom/files/home/AIS/zigbee_update.zip -y
rm -rf /data/data/pl.sviete.dom/files/home/zigbee_update.zip
cp -R /data/data/pl.sviete.dom/files/home/data-backup/* /data/data/pl.sviete.dom/files/home/zigbee2mqtt/data
rm -rf /data/data/pl.sviete.dom/files/home/data-backup


echo -e '\e[40;38;5;82m Wszystko OK. Instalacja trwała \e[30;48;5;82m' $SECONDS 'sekund \e[0m'
curl http://localhost:8122/text_to_speech?text=Instalacja%20trwa%C5%82a%20$SECONDS%20sekund.%20Poczekaj%20na%20ponowne%20uruchomienie%20systemu.

echo "21.10.04" > /data/data/pl.sviete.dom/files/home/AIS/.ais_apt

sleep 6
echo -e '\e[38;5;27m Restartuje usługę ais ... \e[0m'
curl http://localhost:8122/text_to_speech?text=Restartuje%20us%C5%82ug%C4%99%20AIS
pm2 restart ais
