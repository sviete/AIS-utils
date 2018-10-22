################################################
#  Upgrade Googlequicksearchbox.apk          #
################################################


echo "-----------------------------"
echo "Downloading GoogleApk for AIS dom"
echo "-----------------------------"

# Use $PREFIX for compatibility with AIS dom on Android
rm -rf -- "/data/data/pl.sviete.dom/files/usr/tmp/Googlequicksearchbox.apk"

curl -o "/data/data/pl.sviete.dom/files/usr/tmp/Googlequicksearchbox.apk" -L https://raw.githubusercontent.com/sviete/AIS-utils/master/android/apks/Googlequicksearchbox.apk

echo "-----------------------------"
echo "Installing the Googlequicksearchbox..."
echo "-----------------------------"

su -c "mount -o rw,remount,rw /system && mv /data/data/pl.sviete.dom/files/usr/tmp/Googlequicksearchbox.apk /system/priv-app/Googlequicksearchbox.apk && chmod 644 /system/priv-app/Googlequicksearchbox.apk && mount -o ro,remount,ro /system && reboot"
