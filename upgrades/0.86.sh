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


npm install localtunnel

./termux-fix-shebang lt

add adnroid to /data/data/pl.sviete.dom/files/usr/lib/node_modules/localtunnel/node_modules/openurl/openurl.js

npm install -g local-tunnel-manager

pm2 start lt -- -p 8180 -s aisdom


echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
