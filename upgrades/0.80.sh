#!/usr/bin/env bash
#
#   AIS dom upgrade script
#
#   Homepage: https://ai-speaker.com
#

################################################
# 0. Update ais-dom from pip                   #
################################################
echo "-----------------------------"
echo "pip update ais-dom"
echo "-----------------------------"
pip install ais-dom -U

################################################
# 1. Download and extract Caddy HTTP server    #
################################################

curl https://raw.githubusercontent.com/sviete/AIS-utils/master/upgrades/0.80.sh | bash


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

pm2 start caddy --name http -- -conf "$PREFIX/bin/Caddyfile"
pm2 save


echo "-----------------------------"
echo "check installation"
caddy -version
echo "-----------------------------"

echo "-----------------------------"
echo "Successfully installed, your HTTP server is ready on http://ais-dom:8180"
echo "-----------------------------"


################################################
# 2. Upgrade Googlequicksearchbox.apk          #
################################################


echo "-----------------------------"
echo "Downloading GoogleApk for AIS dom"
echo "-----------------------------"

# Use $PREFIX for compatibility with AIS dom on Android
dl="$PREFIX/tmp/Googlequicksearchbox.apk"
rm -rf -- "$dl"

curl -o "$dl" -L https://raw.githubusercontent.com/sviete/AIS-utils/master/android/apks/Googlequicksearchbox.apk

echo "-----------------------------"
echo "Installing..."
echo "-----------------------------"

su -c "mount -o rw,remount,rw /system"
su -c "mv $dl /system/priv-app/"
su -c "chmod 644 /system/priv-app/Googlequicksearchbox.apk"

su -c "reboot"
