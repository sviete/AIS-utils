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
echo "1. replace bash profile"
curl -o "/data/data/pl.sviete.dom/files/home/.bash_profile" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/.bash_profile
chmod +x /data/data/pl.sviete.dom/files/home/.bash_profile

# install python2
echo "2. install python2"
apt install python2 -y

# download zigbee
echo "3. download zigbee.zip"
curl -o /data/data/pl.sviete.dom/files/home/zigbee.zip -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/zigbee.zip

# unzip zigbee
echo "4. unzip zigbee2mqtt"
7z x -mmt=2 -o/data/data/pl.sviete.dom/files/home/zigbee2mqtt /data/data/pl.sviete.dom/files/home/zigbee.zip -y

# remove zip
echo "5. remove zigbee.zip"
rm /data/data/pl.sviete.dom/files/home/zigbee.zip

echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M')
echo "----ALL OK END----"
echo "-----------------------------"
