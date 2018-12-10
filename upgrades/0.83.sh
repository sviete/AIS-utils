#
#   AIS dom upgrade script to version 0.81.x
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/upgrades/0.83.sh | bash
################################################
# 1. Download and extract Caddy HTTP server    #
################################################
echo "-----------------------------"
echo "-----------------------------"
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom upgrade to version 0.83.x"
echo "-----------------------------"


echo "-----------------------------"
echo "Switch caddy to https"
echo "-----------------------------"
echo ":8123 {" > $PREFIX/bin/Caddyfile
echo "    tls /data/data/pl.sviete.dom/files/home/AIS/servercert.pem /data/data/pl.sviete.dom/files/home/AIS/privekey.pem" >> $PREFIX/bin/Caddyfile
echo "    proxy / localhost:8180 {" >> $PREFIX/bin/Caddyfile
echo "        websocket" >> $PREFIX/bin/Caddyfile
echo "        transparent" >> $PREFIX/bin/Caddyfile
echo "    }" >> $PREFIX/bin/Caddyfile
echo "}" >> $PREFIX/bin/Caddyfile

echo "-----------------------------"
echo "pm2 part"
echo "-----------------------------"
echo "inception... go deeper..."
ssh localhost -o StrictHostKeyChecking=no -p 8022 -i /data/data/pl.sviete.dom/files/home/AIS/www/id_rsa_ais << EOF
pm2 restart http
EOF
echo "inception... go back"

echo "-----------------------------------"
echo "Downloading Android apks for AIS dom"
echo "-----------------------------------"
echo "-----------------------------------"
echo "AisExplorer"
echo "-----------------------------------"
curl -o "/data/data/pl.sviete.dom/files/usr/tmp/AisExplorer.apk" -L https://github.com/sviete/AIS-WWW/raw/master/ota/android/AisExplorer.apk
su -c "pm install -r /data/data/pl.sviete.dom/files/usr/tmp/AisExplorer.apk"
echo "-----------------------------------"
echo "AisLauncher"
echo "-----------------------------------"
curl -o "/data/data/pl.sviete.dom/files/usr/tmp/AisLauncher.apk" -L https://github.com/sviete/AIS-WWW/raw/master/ota/android/AisLauncher.apk
su -c "pm install -r /data/data/pl.sviete.dom/files/usr/tmp/AisLauncher.apk"
echo "-----------------------------------"
echo "AisSynchro"
echo "-----------------------------------"
curl -o "/data/data/pl.sviete.dom/files/usr/tmp/AisSynchro.apk" -L https://github.com/sviete/AIS-WWW/raw/master/ota/android/AisSynchro.apk
su -c "pm install -r /data/data/pl.sviete.dom/files/usr/tmp/AisSynchro.apk"

echo "-----------------------------------"
echo "New grants"
echo "-----------------------------------"
su -c "pm grant pl.sviete.dom android.permission.WRITE_SECURE_SETTINGS"
su -c "pm grant pl.sviete.dom android.permission.CHANGE_CONFIGURATION"
su -c "settings put secure enabled_accessibility_services %accessibility:pl.sviete.dom/pl.sviete.dom.DomAccessibilityService"

echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
