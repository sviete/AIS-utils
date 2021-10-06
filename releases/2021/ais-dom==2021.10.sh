#!/data/data/pl.sviete.dom/files/usr/bin/bash
# AIS
# omepage: https://ai-speaker.com
################################################
# Install ais-dom 2021.10...
# run it by executiong in AIS dom console:
getprop | grep AIS
# curl -L https://raw.githubusercontent.com/sviete/AIS-utils/master/releases/2021/ais-dom==2021.10.sh | bash
#
SECONDS=0

echo -e '\e[40;38;5;82m START instalacji wersji \e[30;48;5;82m AIS 2021.10 \e[0m'
curl http://localhost:8122/text_to_speech?text=Start%20instalacji%20wersji%202021.10
sleep 3

echo -e '\e[38;5;11m Pobieram ... \e[0m'
curl http://localhost:8122/text_to_speech?text=Pobieram
curl -o "/data/data/pl.sviete.dom/files/home/AIS/2021.10_wheelhouse.tar.7z" -L  https://github.com/sviete/AIS-utils/blob/master/releases/2021/2021.10_wheelhouse.tar.7z?raw=true

echo -e '\e[38;5;214m Rozpakowuje ... \e[0m'
curl http://localhost:8122/text_to_speech?text=Rozpakowuje
7z x -mmt=2 -o/data/data/pl.sviete.dom/files/home/AIS/ /data/data/pl.sviete.dom/files/home/AIS/2021.10_wheelhouse.tar.7z -y

echo -e '\e[38;5;202m Instaluje ... \e[0m'
curl http://localhost:8122/text_to_speech?text=Instaluje
cd /data/data/pl.sviete.dom/files/home/AIS
pip install -r wheels/requirements.txt --no-index --find-links wheels/

echo -e '\e[40;38;5;82m Wszystko OK. Instalacja trwała \e[30;48;5;82m' $SECONDS 'sekund \e[0m'
curl http://localhost:8122/text_to_speech?text=Instalacja%20trwa%C5%82a%20$SECONDS%20sekund.%20Poczekaj%20na%20ponowne%20uruchomienie%20systemu.

echo 21.10.04 > /data/data/pl.sviete.dom/files/home/AIS/.ais_apt

echo -e '\e[38;5;27m Restartuje usługę ais ... \e[0m'
curl http://localhost:8122/text_to_speech?text=Restartuje%20us%C5%82ug%C4%99%20AIS
pm2 restart ais
