#
#   AIS dom upgrade script to version 0.86.x
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/upgrades/0.86.sh | bash
################################################
echo "-----------------------------"
echo "-----------------------------"
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom upgrade to version 0.86.x"
echo "-----------------------------"

echo "-----------------------------";
echo "Install dom-tunnel ----------";
echo "-----------------------------";
npm install -g dom-tunnel

echo "-----------------------------";
echo "Downloading lovelace json----";
echo "-----------------------------";
curl -o "/data/data/pl.sviete.dom/files/home/AIS/.storage/lovelace" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/lovelace;

echo "-----------------------------";
echo "Install ais-dom--------------";
echo "-----------------------------";
curl -o "/sdcard/ais-dom-0.86.4.tar.gz" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/ais-dom-0.86.4.tar.gz;
pip install /sdcard/ais-dom-0.86.4.tar.gz -U

echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
