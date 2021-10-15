#!/data/data/pl.sviete.dom/files/usr/bin/bash
# AIS
# Homepage: https://ai-speaker.com
################################################
# Install ais-dom on BETA chanel
# run it by executiong in AIS dom console:
# curl -L https://raw.githubusercontent.com/sviete/AIS-utils/master/releases/beta.sh | bash
#

# AIS VERSIONS
AIS_VERSSION="21.09.19"
AIS_ZIGBEE_VERSION='"version": "1.21.1",'
AIS_ANDROID_VERSSION="versionName=3.0.0"
AIS_VERSSION_OLD="210919"
# AIS VERSIONS

echo -e '\e[38;5;220m START instalacji wersji \e[30;48;5;208m AIS BETA ' "$AIS_VERSSION" '\e[0m'
curl http://localhost:8122/text_to_speech?text=Start%20instalacji%20wersji%AIS%20BETA

apt update
curl -o ~/AIS/logo.txt -L https://raw.githubusercontent.com/sviete/AIS-utils/master/releases/logo.txt
apt install -y w3m
apt install -y neofetch

neofetch --source  ~/AIS/logo.txt

# TEST requirements
AIS_CURR_VERSION=`cat /data/data/pl.sviete.dom/files/home/AIS/.ais_apt`
echo -e '\e[38;5;220m Aktualizacja AIS z wersji ' "$AIS_CURR_VERSION" ' \e[0m'
AIS_CURR_VERSION="${AIS_CURR_VERSION//.}"

if [ $AIS_CURR_VERSION -ge $AIS_VERSSION_OLD ]
  then
    echo -e '\e[38;5;220m VERSION TEST \e[30;48;5;208m OK \e[0m'
    echo -e '\e[38;5;220m SYSTEM AKTUALNY \e[30;48;5;208m OK \e[0m'
    curl http://localhost:8122/text_to_speech?text=Stop%20system%20aktualny
    curl -X POST http://localhost:8180/api/webhook/aisdomprocesscommandfromframe -H 'Content-Type: application/json' -d '{"topic":"ais/set_update_status", "payload": "updated"}'

    exit 0
  else
    curl http://localhost:8122/text_to_speech?text=Stop%20niezgodno%C5%9B%C4%87%20wersji
    curl -X POST http://localhost:8180/api/webhook/aisdomprocesscommandfromframe -H 'Content-Type: application/json' -d '{"topic":"ais/set_update_status", "payload": "outdated"}'
    echo -e '\e[38;5;220m Niezgodność wersji \e[30;48;5;208m EXIT\e[0m'
    echo -e '\e[38;5;220m Aktualizacja możliwa z wersji co najmniej \e[30;48;5;208m' "$AIS_VERSSION_OLD" '\e[0m'
    echo -e '\e[38;5;220m VERSION NOK \e[30;48;5;208m STOP\e[0m'
    echo -e '\e[38;5;220m VERSION NOK \e[30;48;5;208m STOP\e[0m'
    echo -e '\e[38;5;220m VERSION NOK \e[30;48;5;208m STOP\e[0m'

    exit 1
fi

exit 0
