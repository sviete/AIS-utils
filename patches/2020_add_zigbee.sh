#
#   AIS dom
#
#   Homepage: https://ai-speaker.com
#
################################################
#  Add zigbee script
#  run it by executiong in AIS dom console:
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/2020_add_zigbee.sh | bash
#
################################################
set -e

# bash
curl -o "/data/data/pl.sviete.dom/files/home/.bash_profile" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/.bash_profile
chmod +x /data/data/pl.sviete.dom/files/home/.bash_profile

# install zigbee2mqtt
cd ~
apt install git python2 -y
git clone https://github.com/Koenkk/zigbee2mqtt.git
cd ~/zigbee2mqtt
npm install

# test start service
# npm start

# add service
cd ~/zigbee2mqtt
pm2 start npm  --name zigbee --output NULL --error NULL --restart-delay=30000 -- run start
pm2 save

~/.bash_profile

echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M')
echo "----ALL OK END -> RESTART----"
echo "-----------------------------"
