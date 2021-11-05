#
#   AIS dom upgrade script to version 210919
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/upgrades/210919.sh | bash
################################################
echo "-----------------------------"
echo "-----------------------------"
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom upgrade to version 210919"
echo "-----------------------------"
echo "-----------------------------"


curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Start aktualizacji. To potrwa 45 minut. Poczekaj."}' http://localhost:8122/text_to_speech &&


echo "# The main AI-Speaker repository:" > /data/data/pl.sviete.dom/files/usr/etc/apt/sources.list
echo "deb [trusted=yes] https://powiedz.co/apt dom stable" >> /data/data/pl.sviete.dom/files/usr/etc/apt/sources.list
echo "deb [trusted=yes] https://powiedz.co/apt python 3.9" >> /data/data/pl.sviete.dom/files/usr/etc/apt/sources.list
rm -rf /data/data/pl.sviete.dom/files/usr/etc/apt/sources.list.d
cp /data/data/pl.sviete.dom/files/usr/etc/mosquitto/mosquitto.conf /sdcard/mosquitto.conf
apt update
curl http://localhost:8122/text_to_speech?text=Start%20instalacji%20binarek
apt install -y zstd
apt install -y libseccomp
apt install -y libgsasl
apt install -y daemonize
apt install -y cloudflared 
DEBIAN_FRONTEND=noninteractive apt -y upgrade
cp /sdcard/mosquitto.conf /data/data/pl.sviete.dom/files/usr/etc/mosquitto/mosquitto.conf
pip uninstall -y cffi
pip cache remove cffi
pip install cffi
cd /data/data/pl.sviete.dom/files/home
cd /data/data/pl.sviete.dom/files/home/zwavejs2mqtt
pm2 stop zwave
npm rebuild
echo "npm install pm2 -g" > /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "pm2 update" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "pm2 stop ais" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "curl -o /data/data/pl.sviete.dom/files/home/zigbee.zip -L https://powiedz.co/ota/zigbee.zip" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "cp -R /data/data/pl.sviete.dom/files/home/zigbee2mqtt/data /data/data/pl.sviete.dom/files/home/data_copy"  >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "7z x -mmt=2 -o/data/data/pl.sviete.dom/files/home/zigbee2mqtt /data/data/pl.sviete.dom/files/home/zigbee.zip -y" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "cp -R /data/data/pl.sviete.dom/files/home/data_copy/* /data/data/pl.sviete.dom/files/home/zigbee2mqtt/data" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "rm -rf /data/data/pl.sviete.dom/files/home/data_copy" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "rm -rf /data/data/pl.sviete.dom/files/home/data-backup" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "rm /data/data/pl.sviete.dom/files/home/zigbee.zip" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "rm /data/data/pl.sviete.dom/files/home/zigbee_update.zip" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "cd /data/data/pl.sviete.dom/files/home/zigbee2mqtt" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "npm rebuild" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "curl http://localhost:8122/text_to_speech?text=Instaluje%20python" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "pip install ais-dom --find-links /data/data/pl.sviete.dom/files/home/AIS/ais_update -U" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "rm -rf /data/data/pl.sviete.dom/files/home/AIS/ais_update" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "pm2 resurrect" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "pm2 start all" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "pm2 save" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "curl http://localhost:8122/text_to_speech?text=Ponowne%20uruchomienie" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "termux-fix-shebang /data/data/pl.sviete.dom/files/usr/lib/node_modules/pm2/bin/pm2" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
echo "echo 21.09.19 > /data/data/pl.sviete.dom/files/home/AIS/.ais_apt" >> /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
chmod +x /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh
daemonize /data/data/pl.sviete.dom/files/home/AIS/ais_daemonize.sh


echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
