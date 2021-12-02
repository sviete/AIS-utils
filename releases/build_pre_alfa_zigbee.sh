#!/data/data/pl.sviete.dom/files/usr/bin/bash
# AIS
# omepage: https://ai-speaker.com
################################################
# Build zigbee2mqtt on PRE-ALPHA chanel
# run it by executiong in AIS dom console:
# curl -L https://raw.githubusercontent.com/sviete/AIS-utils/master/releases/build_pre_alfa_zigbee.sh | bash
#

if [ -d ~/AIS-utils ]
then
    echo -e '\e[38;5;220m OK repozytorium istnieje \e[0m'
else
    echo -e '\e[38;5;220m Klonowanie repozytorium ... \e[0m'
    cd ~
    git clone --depth 1 https://github.com/sviete/AIS-utils.git
fi

cd ~
echo -e '\e[38;5;220m STOP zigbee \e[0m'
pm2 stop zigbee

echo -e '\e[38;5;220m BACKUP zigbee \e[0m'
mv ~/zigbee2mqtt ~/zigbee2mqtt_backup

echo -e '\e[38;5;220m CLONE zigbee code \e[0m'
git clone --depth=1 https://github.com/Koenkk/zigbee2mqtt.git


echo -e '\e[38;5;220m npm... \e[0m'
cd ~/zigbee2mqtt
git checkout HEAD -- npm-shrinkwrap.json
git pull
npm ci --unsafe-perm

echo -e '\e[38;5;220m configuration.yaml \e[0m'
echo "homeassistant: true" > data/configuration.yaml
echo "permit_join: false" >> data/configuration.yaml
echo "mqtt:" >> data/configuration.yaml
echo "base_topic: zigbee2mqtt" >> data/configuration.yaml
echo "  server: mqtt://localhost" >> data/configuration.yaml
echo "serial:" >> data/configuration.yaml
echo "  port: /dev/ttyACM0" >> data/configuration.yaml
echo "  adapter: auto" >> data/configuration.yaml
echo "frontend:" >> data/configuration.yaml
echo "  port: 8099" >> data/configuration.yaml
echo "advanced:" >> data/configuration.yaml
echo "  log_level: info" >> data/configuration.yaml
echo "  log_output:" >> data/configuration.yaml
echo "    - console" >> data/configuration.yaml
echo "  channel: 11" >> data/configuration.yaml

echo -e '\e[38;5;220m START node, Ctrl+c after test... \e[0m'
node index.js

echo -e '\e[38;5;220m ZIP ... \e[0m'
cd ~
7za a -mmt=2 ~/zigbee_pre_alfa.zip ~/zigbee2mqtt/.

echo -e '\e[38;5;220m Wysyłanie wersji do Github... \e[0m'
cd ~/AIS-utils
mv ~/zigbee_pre_alfa.zip releases/zigbee_pre_alfa.zip
git add releases/zigbee_pre_alfa.zip
git commit -m 'bump zigbee_pre_alfa'
git push

echo -e '\e[38;5;220m START zigbee2mqtt... \e[0m'
rm -rf ~/zigbee2mqtt
mv ~/zigbee2mqtt_backup ~/zigbee2mqtt
pm2 start zigbee

echo "DONE!"
