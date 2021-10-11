#!/data/data/pl.sviete.dom/files/usr/bin/bash
# AIS
# omepage: https://ai-speaker.com
################################################
# Install ais-dom on BETA chanel
# run it by executiong in AIS dom console:
# curl -L https://raw.githubusercontent.com/sviete/AIS-utils/master/releases/beta.sh | bash
#


echo -e '\e[38;5;220m START instalacji wersji \e[30;48;5;208m AIS BETA \e[0m'
curl http://localhost:8122/text_to_speech?text=Start%20instalacji%20wersji%AIS%20BETA

curl -o ~/AIS/logo.txt -L https://raw.githubusercontent.com/sviete/AIS-utils/master/releases/logo.txt
apt update
apt install -y w3m
apt install -y neofetch

neofetch --source  ~/AIS/logo.txt

sleep 6
SECONDS=0


echo -e '\e[40;38;5;220m Wszystko OK. Instalacja trwała \e[30;48;5;208m' $SECONDS 'sekund \e[0m'
curl http://localhost:8122/text_to_speech?text=Instalacja%20trwa%C5%82a%20$SECONDS%20sekund.%20Poczekaj%20na%20ponowne%20uruchomienie%20systemu.
