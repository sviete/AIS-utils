#
#   AIS dom upgrade script to version 0.86.x
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/20190204_dom_tunnel.sh | bash


npm install -g dom-tunnel


curl -o "/data/data/pl.sviete.dom/files/home/AIS/.storage/lovelace" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/lovelace;


curl -o "/sdcard/ais-dom-0.86.4.tar.gz" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/ais-dom-0.86.4.tar.gz;


pip install /sdcard/ais-dom-0.86.4.tar.gz -U
