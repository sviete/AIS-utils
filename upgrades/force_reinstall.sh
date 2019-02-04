################################################
#   AIS dom upgrade force script
#
#   Homepage: https://github.com/sviete/AIS-utils
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/upgrades/force_reinstall.sh | bash
################################################

echo "-----------------------------"
echo "-----------------------------"
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom reinstall all"
echo "-----------------------------"


echo "-----------------------------"
echo "1. Linux part ---------------"
echo "-----------------------------"

apt -y update
apt -y upgrade


echo "-----------------------------"
echo "2. Python part --------------"
echo "-----------------------------"

pip install ais-dom -U


echo "-----------------------------"
echo "3. Android part -------------"
echo "-----------------------------"


curl -o "/data/data/pl.sviete.dom/files/usr/tmp/AisPanelApp.apk" -L https://powiedz.co/ota/android/AisPanelApp.apk &&
su -c "pm install -r /data/data/pl.sviete.dom/files/usr/tmp/AisPanelApp.apk"

echo "ALL DONE!"
echo $(date '+%Y %b %d %H:%M') STOP
