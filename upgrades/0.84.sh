#
#   AIS dom upgrade script to version 0.84.x
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/upgrades/0.84.sh | bash
################################################
echo "-----------------------------"
echo "-----------------------------"
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom upgrade to version 0.84.x"
echo "-----------------------------"
echo "-----------------------------------"
echo "Downloading Android apks for AIS dom"
echo "-----------------------------------"
echo "-----------------------------------"
echo "AisExplorer"
echo "-----------------------------------"
curl -o "/data/data/pl.sviete.dom/files/usr/tmp/AisExplorer.apk" -L https://github.com/sviete/AIS-WWW/raw/master/ota/android/AisExplorer.apk &&
su -c "pm install -r /data/data/pl.sviete.dom/files/usr/tmp/AisExplorer.apk" &&
echo "-----------------------------------"
echo "AisLauncher"
echo "-----------------------------------"
curl -o "/data/data/pl.sviete.dom/files/usr/tmp/AisLauncher.apk" -L https://github.com/sviete/AIS-WWW/raw/master/ota/android/AisLauncher.apk &&
su -c "pm install -r /data/data/pl.sviete.dom/files/usr/tmp/AisLauncher.apk" &&
echo "-----------------------------------"
echo "AisSynchro"
echo "-----------------------------------"
curl -o "/data/data/pl.sviete.dom/files/usr/tmp/AisSynchro.apk" -L https://github.com/sviete/AIS-WWW/raw/master/ota/android/AisSynchro.apk &&
su -c "pm install -r /data/data/pl.sviete.dom/files/usr/tmp/AisSynchro.apk" &&

echo "-----------------------------------"
echo "New grants"
echo "-----------------------------------"
su -c "pm grant pl.sviete.dom android.permission.WRITE_SECURE_SETTINGS" &&
su -c "pm grant pl.sviete.dom android.permission.CHANGE_CONFIGURATION" &&
su -c "settings put secure enabled_accessibility_services %accessibility:pl.sviete.dom/pl.sviete.dom.DomAccessibilityService" &&

echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
