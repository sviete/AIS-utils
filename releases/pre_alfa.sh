#!/data/data/com.termux/files/usr/bin/bash
# AIS
# Homepage: https://ai-speaker.com
################################################
# Install ais-dom on PRE ALFA chanel
# run it by executiong in AIS dom console:
# curl -L https://raw.githubusercontent.com/sviete/AIS-utils/master/releases/pre_alfa.sh -o pre_alfa.sh
# chmod +x pre_alfa.sh
# ./pre_alfa.sh

echo -e '\e[38;5;220m Script version 2023.08.31.0 \e[0m'


# AIS VERSIONS
AIS_VERSSION="23.08.11"
AIS_HA_VERSSION="2023.9.0b0"
AIS_ZIGBEE_VERSION='"version": "1.32.2",'
AIS_ANDROID_VERSSION="versionName=4.3.3"
AIS_VERSSION_OLD="210901"
# AIS VERSIONS

echo -e '\e[38;5;220m START instalacji wersji \e[30;48;5;208m AIS PRE ALFA ' "$AIS_VERSSION" '\e[0m'
curl http://localhost:8122/text_to_speech?text=Start%20instalacji%20wersji%AIS%20ALFA

# fix for not dispatching media key event because user setup is in progress
su -c 'settings put secure user_setup_complete 1'

curl -o ~/AIS/logo.txt -L https://raw.githubusercontent.com/sviete/AIS-utils/master/releases/logo.txt
neofetch --source  ~/AIS/logo.txt


# TEST requirements
AIS_CURR_VERSION=`cat /data/data/com.termux/files/home/AIS/.ais_apt`
echo -e '\e[38;5;220m Aktualizacja AIS z wersji ' "$AIS_CURR_VERSION" ' \e[0m'
AIS_CURR_VERSION="${AIS_CURR_VERSION//.}"

if [ $AIS_CURR_VERSION -ge $AIS_VERSSION_OLD ]
  then
    echo -e '\e[38;5;220m VERSION TEST \e[30;48;5;208m OK \e[0m'
  else
    curl http://localhost:8122/text_to_speech?text=Stop%20niezgodno%C5%9B%C4%87%20wersji
    curl -X POST http://localhost:8180/api/webhook/aisdomprocesscommandfromframe -H 'Content-Type: application/json' -d '{"topic":"ais/set_update_status", "payload": "outdated"}'
    echo -e '\e[38;5;220m Niezgodność wersji \e[30;48;5;208m EXIT\e[0m'
    echo -e '\e[38;5;220m VERSION NOK \e[30;48;5;208m STOP\e[0m'
    echo -e '\e[38;5;220m VERSION NOK \e[30;48;5;208m STOP\e[0m'
    echo -e '\e[38;5;220m VERSION NOK \e[30;48;5;208m STOP\e[0m'

    exit 1
fi

SECONDS=0

# AIS ZIGBEE APP
echo -e '\e[38;5;220m ZIGBEE \e[30;48;5;208m ' "$AIS_ZIGBEE_VERSION" '\e[0m'
if  grep -q "$AIS_ZIGBEE_VERSION" '/data/data/com.termux/files/home/zigbee2mqtt/package.json' ; then
  echo -e '\e[38;5;220m Zigbee OK... \e[0m'
else
  echo -e '\e[38;5;220m Pobieram Zigbee ... \e[0m'
  curl http://localhost:8122/text_to_speech?text=Pobieram%20Zigbee
  curl -H 'Cache-Control: no-cache' -o "/data/data/com.termux/files/home/AIS/zigbee_update.zip" -L https://github.com/sviete/AIS-utils/blob/master/releases/zigbee_pre_alfa.zip?raw=true
  curl -X POST http://localhost:8180/api/webhook/aisdomprocesscommandfromframe -H 'Content-Type: application/json' -d '{"topic":"ais/set_update_progress", "payload": "0.6:0.9"}'
  cp -R /data/data/com.termux/files/home/zigbee2mqtt/data /data/data/com.termux/files/home/data-backup
  rm -rf /data/data/com.termux/files/home/zigbee2mqtt

  echo -e '\e[38;5;220m Rozpakowuje Zigbee ... \e[0m'
  curl http://localhost:8122/text_to_speech?text=Rozpakowuje%20Zigbee
  7z x -mmt=2 -o/data/data/com.termux/files/home/zigbee2mqtt /data/data/com.termux/files/home/AIS/zigbee_update.zip -y
  rm -rf /data/data/com.termux/files/home/AIS/zigbee_update.zip
  cp -R /data/data/com.termux/files/home/data-backup/* /data/data/com.termux/files/home/zigbee2mqtt/data
  rm -rf /data/data/com.termux/files/home/data-backup
fi
curl -X POST http://localhost:8180/api/webhook/aisdomprocesscommandfromframe -H 'Content-Type: application/json' -d '{"topic":"ais/set_update_progress", "payload": "0.9:0.92"}'


# AIS PYTHON APP
echo -e '\e[38;5;220m Pobieram AIS ... \e[0m'
curl http://localhost:8122/text_to_speech?text=Pobieram%20AIS
curl -X POST http://localhost:8180/api/webhook/aisdomprocesscommandfromframe -H 'Content-Type: application/json' -d '{"topic":"ais/set_update_status", "payload": "downloading"}'
curl -X POST http://localhost:8180/api/webhook/aisdomprocesscommandfromframe -H 'Content-Type: application/json' -d '{"topic":"ais/set_update_progress", "payload": "0.1:0.3"}'
curl -o "/data/data/com.termux/files/home/AIS/pre_alfa_wheelhouse.tar.7z" -L  https://github.com/sviete/AIS-utils/blob/master/releases/pre_alfa_wheelhouse.tar.7z?raw=true
curl -X POST http://localhost:8180/api/webhook/aisdomprocesscommandfromframe -H 'Content-Type: application/json' -d '{"topic":"ais/set_update_progress", "payload": "0.2:0.6"}'

echo -e '\e[38;5;220m Rozpakowuje AIS ... \e[0m'
curl http://localhost:8122/text_to_speech?text=Rozpakowuje%20AIS
7z x -mmt=2 -o/data/data/com.termux/files/home/AIS/ /data/data/com.termux/files/home/AIS/pre_alfa_wheelhouse.tar.7z -y
curl -X POST http://localhost:8180/api/webhook/aisdomprocesscommandfromframe -H 'Content-Type: application/json' -d '{"topic":"ais/set_update_progress", "payload": "0.3:0.6"}'

echo -e '\e[38;5;220m Instaluje AIS ... \e[0m'
curl http://localhost:8122/text_to_speech?text=Instaluje%20AIS
apt update
apt -y -o Dpkg::Options::="--force-confnew" upgrade
apt -y autoremove
curl -X POST http://localhost:8180/api/webhook/aisdomprocesscommandfromframe -H 'Content-Type: application/json' -d '{"topic":"ais/set_update_status", "payload": "installing"}'
cd /data/data/com.termux/files/home/AIS
pip install -r wheels/requirements.txt --no-index --find-links=wheels -U
pip install pyinotify -U
pip install aisapi==0.1.1
curl -X POST http://localhost:8180/api/webhook/aisdomprocesscommandfromframe -H 'Content-Type: application/json' -d '{"topic":"ais/set_update_progress", "payload": "0.6:0.6"}'
rm -rf /data/data/com.termux/files/home/AIS/wheels
rm -rf /data/data/com.termux/files/home/AIS/pre_alfa_wheelhouse.tar.7z

echo '# AIS Config file for mosquitto on gate' > '/data/data/com.termux/files/usr/etc/mosquitto/mosquitto.conf'
echo 'listener 1883 0.0.0.0' > '/data/data/com.termux/files/usr/etc/mosquitto/mosquitto.conf'
echo 'protocol mqtt' >> '/data/data/com.termux/files/usr/etc/mosquitto/mosquitto.conf'
echo 'allow_anonymous true' >> '/data/data/com.termux/files/usr/etc/mosquitto/mosquitto.conf'

echo -e '\e[38;5;220m Instaluje AIS-webcmd ... \e[0m'
cd ~/AIS-webcmd/
npm install
echo -e '\e[38;5;220m Rebuild zigbee2mqtt ... \e[0m'
cd ~/zigbee2mqtt/
npm rebuild

# Code server
apt -y install tur-repo
apt -y install code-server
touch ~/AIS/ais-code-server.js
echo "const { execSync } = require('child_process');" > ~/AIS/ais-code-server.js
echo "execSync('code-server  --bind-addr 0.0.0.0:8080 --disable-telemetry --auth none',{stdio:['inherit','inherit','inherit']})" >> ~/AIS/ais-code-server.js
pm2 delete code-server
pm2 start ~/AIS/ais-code-server.js --name code-server --output NULL --error NULL --restart-delay=30000
pm2 save

# demonize
apt -y install daemonize
apt -y install libsodium
termux-fix-shebang /data/data/com.termux/files/usr/bin/pm2
echo -e '\e[38;5;220m Daemonize start \e[0m'
echo 'cd ~/.pm2' > /data/data/com.termux/files/home/AIS/ais_daemonize.sh
echo 'cd ~/.pm2' > /data/data/com.termux/files/home/AIS/ais_daemonize.sh
echo 'npm install pm2' >> /data/data/com.termux/files/home/AIS/ais_daemonize.sh
echo 'node /data/data/com.termux/files/usr/bin/pm2 update' >> /data/data/com.termux/files/home/AIS/ais_daemonize.sh
echo 'set LD_LIBRARY_PATH=""' >> /data/data/com.termux/files/home/AIS/ais_daemonize.sh
echo 'node /data/data/com.termux/files/usr/bin/pm2 delete ais' >> /data/data/com.termux/files/home/AIS/ais_daemonize.sh
echo 'node /data/data/com.termux/files/usr/bin/pm2 delete webssh' >> /data/data/com.termux/files/home/AIS/ais_daemonize.sh
echo 'node /data/data/com.termux/files/usr/bin/pm2 delete ftp' >> /data/data/com.termux/files/home/AIS/ais_daemonize.sh
echo 'node /data/data/com.termux/files/usr/bin/pm2 delete mqtt' >> /data/data/com.termux/files/home/AIS/ais_daemonize.sh
echo ''
echo 'cd ~' >> /data/data/com.termux/files/home/AIS/ais_daemonize.sh
echo 'node /data/data/com.termux/files/usr/bin/pm2 start hass --name ais --output NULL --error NULL --interpreter=python --restart-delay=30000 -- --config /data/data/com.termux/files/home/AIS' >> /data/data/com.termux/files/home/AIS/ais_daemonize.sh
echo 'node /data/data/com.termux/files/usr/bin/pm2 start ttyd --name webssh --output NULL --error NULL --restart-delay=30000 -- -p 8888 bash' >> /data/data/com.termux/files/home/AIS/ais_daemonize.sh
echo 'node /data/data/com.termux/files/usr/bin/pm2 start mosquitto --name mqtt --output NULL --error NULL --restart-delay=30000 -- -c /data/data/com.termux/files/usr/etc/mosquitto/mosquitto.conf' >> /data/data/com.termux/files/home/AIS/ais_daemonize.sh
echo 'node /data/data/com.termux/files/usr/bin/pm2 start busybox --name ftp --output  /dev/null --error  /dev/null --restart-delay=150000 -- tcpsvd -vE 0.0.0.0 1024 busybox ftpd -w /sdcard' >> /data/data/com.termux/files/home/AIS/ais_daemonize.sh
echo 'node /data/data/com.termux/files/usr/bin/pm2 save' >> /data/data/com.termux/files/home/AIS/ais_daemonize.sh
echo ''
echo -e '\e[38;5;220m ANDROID \e[30;48;5;208m ' "$AIS_ANDROID_VERSSION" '\e[0m'
if [ `su -c "dumpsys package com.termux | grep versionName" | tr -d '[:space:]'` != "$AIS_ANDROID_VERSSION" ]; then
    echo -e '\e[38;5;220m Pobieram i instaluje Android ... \e[0m'
    echo "su -c 'am start -n launcher.sviete.pl.domlauncherapp/.LauncherActivity -e command ais-dom-update'" >> /data/data/com.termux/files/home/AIS/ais_daemonize.sh
else
    echo -e '\e[38;5;220m Android OK... \e[0m'
fi
chmod +x /data/data/com.termux/files/home/AIS/ais_daemonize.sh
daemonize -o ~/AIS/ais_daemonize.log -e ~/AIS/ais_daemonize_log ~/AIS/ais_daemonize.sh
echo -e '\e[38;5;220m Daemonize end \e[0m'

echo -e '\e[40;38;5;220m OK. Instalacja trwała \e[30;48;5;208m' "$SECONDS" 'sekund \e[0m'
curl http://localhost:8122/text_to_speech?text=Instalacja%20trwa%C5%82a%20$SECONDS%20sekund.%20Poczekaj%20na%20ponowne%20uruchomienie%20systemu.

echo "$AIS_VERSSION" > /data/data/com.termux/files/home/AIS/.ais_apt

sleep 6


# # AIS ANDROID APP
# echo -e '\e[38;5;220m ANDROID \e[30;48;5;208m ' "$AIS_ANDROID_VERSSION" '\e[0m'
# if [ `su -c "dumpsys package com.termux | grep versionName" | tr -d '[:space:]'` != "$AIS_ANDROID_VERSSION" ]; then
#     echo -e '\e[38;5;220m Pobieram i instaluje Android ... \e[0m'
#     curl http://localhost:8122/text_to_speech?text=Pobieram%20Android%20i%20restartuje%20AIS
#     curl -X POST http://localhost:8180/api/webhook/aisdomprocesscommandfromframe -H 'Content-Type: application/json' -d '{"topic":"ais/set_update_progress", "payload": "0.95:0.95"}'
#     curl -X POST http://localhost:8180/api/webhook/aisdomprocesscommandfromframe -H 'Content-Type: application/json' -d '{"topic":"ais/set_update_status", "payload": "restart"}'
#     su -c 'am start -n launcher.sviete.pl.domlauncherapp/.LauncherActivity -e command ais-dom-update-beta'
#     curl -X POST http://localhost:8180/api/webhook/aisdomprocesscommandfromframe -H 'Content-Type: application/json' -d '{"topic":"ais/set_update_progress", "payload": "1:0.97"}'
# else
#     echo -e '\e[38;5;220m Android OK... \e[0m'
#     echo -e '\e[38;5;220m Restartuje usługę ais ... \e[0m'
#     curl http://localhost:8122/text_to_speech?text=Restartuje%20us%C5%82ug%C4%99%20AIS
#     curl -X POST http://localhost:8180/api/webhook/aisdomprocesscommandfromframe -H 'Content-Type: application/json' -d '{"topic":"ais/set_update_status", "payload": "restart"}'
#     curl -X POST http://localhost:8180/api/webhook/aisdomprocesscommandfromframe -H 'Content-Type: application/json' -d '{"topic":"ais/set_update_progress", "payload": "1:0.95"}'
#     # restart ais
#     pm2 restart ais
#     pkill -9 python
# fi

exit 0
