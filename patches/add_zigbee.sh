#
#   AIS dom
#
#   Homepage: https://ai-speaker.com
#
################################################
#  Add zigbee script
#  run it by executiong in AIS dom console:
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/add_zigbee.sh | bash
#
################################################
set -e

# bash
curl -o "/data/data/pl.sviete.dom/files/home/.bash_profile" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/.bash_profile
chmod +x /data/data/pl.sviete.dom/files/home/.bash_profile

# install python2
apt install git python2 -y

# download zigbee
curl -o /data/data/pl.sviete.dom/files/home/zigbee.zip -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/zigbee.zip

# unzip zigbee
7z x -mmt=2 -o /data/data/pl.sviete.dom/files/home/zigbee2mqtt

# remove zip
rm /data/data/pl.sviete.dom/files/home/zigbee.zip /data/data/pl.sviete.dom/files/home/zigbee.zip

echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M')
echo "----ALL OK END----"
echo "-----------------------------"
