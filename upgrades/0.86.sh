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
echo "inception... go deeper..."
ssh localhost -o StrictHostKeyChecking=no -p 8022 -i /data/data/pl.sviete.dom/files/home/AIS/www/id_rsa_ais << EOF
npm install -g dom-tunnel
curl -o "/data/data/pl.sviete.dom/files/home/AIS/.storage/lovelace" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/lovelace
EOF
echo "inception... go back"

echo "-----------------------------";
echo "Downloading lovelace json----";
echo "-----------------------------";
curl -o "/data/data/pl.sviete.dom/files/home/AIS/.storage/lovelace" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/lovelace

echo "-----------------------------";
echo "Upgrade pip------------------";
echo "-----------------------------";
pip install pip -U;

echo "-----------------------------";
echo "Install ais-dom--------------";
echo "-----------------------------";
curl -o "/sdcard/ais-dom-0.86.7.tar.gz" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/ais-dom-0.86.7.tar.gz;
pip install /sdcard/ais-dom-0.86.7.tar.gz -U;

echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
