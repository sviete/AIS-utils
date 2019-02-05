#
#   AIS dom upgrade script to version 0.80.x
#
#   Homepage: https://ai-speaker.com
#

################################################
# 1. Download and extract Caddy HTTP server    #
################################################

echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom upgrade to version 0.80.x"
echo "-----------------------------"

echo "-----------------------------"
echo "apt install libxslt-dev"
apt install -y libxslt-dev

echo "-----------------------------"
echo "Downloading Caddy for AIS dom"
echo "-----------------------------"

# Use $PREFIX for compatibility with AIS dom on Android
dl="$PREFIX/tmp/caddy.tar.gz"
rm -rf -- "$dl"

curl -o "$dl" -L https://raw.githubusercontent.com/sviete/AIS-utils/master/caddy/caddy_v0.11.0_linux_arm7.tar.gz

echo "-----------------------------"
echo "Extracting..."
echo "-----------------------------"

tar xf "$dl" -C "$PREFIX/tmp/"
chmod +x "$PREFIX/tmp/caddy"
chmod 777 "$PREFIX/tmp/Caddyfile"

echo "-----------------------------"
echo "Putting caddy in bin path"
echo "-----------------------------"

mv "$PREFIX/tmp/caddy" "$PREFIX/bin/caddy"
mv "$PREFIX/tmp/Caddyfile" "$PREFIX/bin/Caddyfile"
rm -rf "$dl"


echo "-----------------------------"
echo "pm2 part"
echo "-----------------------------"
echo "inception... go deeper..."
ssh localhost -o StrictHostKeyChecking=no -p 8022 -i /data/data/pl.sviete.dom/files/home/AIS/www/id_rsa_ais << EOF
pm2 delete http
pm2 start caddy --name http -- -conf "$PREFIX/bin/Caddyfile"
pm2 save
EOF
echo "inception... go back"


echo "-----------------------------"
echo "check installation"
caddy -version
echo "-----------------------------"

echo "-----------------------------"
echo "Successfully installed, your HTTP server is ready on http://ais-dom:8180"
echo "-----------------------------"


################################################
# 2. HDMI 4K                                   #
################################################
echo "HDMI 4K to build.prop start"
su -c "mount -o rw,remount,rw /system && sed -i '/ro.platform.support.over.4k30/d' '/system/build.prop' &&  echo 'ro.platform.support.over.4k30=false' >> /system/build.prop && mount -o ro,remount,ro /system && echo 'done'"
echo "HDMI 4K to build.prop done"


echo "-----------------------------";
echo "Install dom-tunnel ----------";
echo "-----------------------------";
npm install -g dom-tunnel
echo "-----------------------------";
echo "Upgrade pip------------------";
echo "-----------------------------";
pip install pip -U
echo "-----------------------------";
echo "-----------------------------";
echo "Downloading lovelace json----";
echo "-----------------------------";
curl -o "/data/data/pl.sviete.dom/files/home/AIS/.storage/lovelace" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/lovelace;


echo $(date '+%Y %b %d %H:%M') STOP
