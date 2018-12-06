#
#   AIS dom upgrade script to version 0.81.x
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/04122018_switch_to_http.sh | bash
################################################
# 1. Download and extract Caddy HTTP server    #
################################################
echo "-----------------------------"
echo "-----------------------------"
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom switch to http ------"
echo "-----------------------------"


echo "-----------------------------"
echo "Switch caddy to https -------"
echo "-----------------------------"
echo ":8123 {" > $PREFIX/bin/Caddyfile
echo "    tls /data/data/pl.sviete.dom/files/home/AIS/servercert.pem /data/data/pl.sviete.dom/files/home/AIS/privekey.pem" >> $PREFIX/bin/Caddyfile
echo "    proxy / localhost:8180 {" >> $PREFIX/bin/Caddyfile
echo "        websocket" >> $PREFIX/bin/Caddyfile
echo "        transparent" >> $PREFIX/bin/Caddyfile
echo "    }" >> $PREFIX/bin/Caddyfile
echo "}" >> $PREFIX/bin/Caddyfile

echo "-----------------------------"
echo "Switch ais dom to http ------"
echo "-----------------------------"
curl -o "/data/data/pl.sviete.dom/files/usr/lib/python3.6/site-packages/homeassistant/ais-dom-config/configuration.yaml" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/configuration.yaml;


echo "---count to 10 and restart----";
sleep 1
echo "1";
sleep 1
echo "2";
sleep 1
echo "3";
sleep 1
echo "4";
sleep 1
echo "5";
sleep 1
echo "6";
sleep 1
echo "7";
sleep 1
echo "8";
sleep 1
echo "9";
sleep 1
echo "10";
sleep 1

echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M')
echo "----ALL OK END -> RESTART----"
echo "-----------------------------"

echo "-----------------------------";
echo "reboot ----------------------";
echo "-----------------------------";

su -c "reboot now"

# Success
exit 0;
