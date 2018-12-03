#
#   AIS dom
#
#   Homepage: https://ai-speaker.com
#
################################################
#  Remove Google Play
################################################


echo "-----------------------------";
echo "Downloading aps for AIS dom";
echo "-----------------------------";


curl -o "/data/data/pl.sviete.dom/files/usr/tmp/GoogleApp.apk" -L https://powiedz.co/ota/android/GoogleApp.apk;
curl -o "/data/data/pl.sviete.dom/files/usr/tmp/GoogleTts.apk" -L https://powiedz.co/ota/android/GoogleTts.apk;
curl -o "/data/data/pl.sviete.dom/files/usr/tmp/GoogleChrome.apk" -L https://powiedz.co/ota/android/GoogleChrome.apk;


echo "-----------------------------";
echo "----mount system to write----";
echo "-----------------------------";

su -c "mount -o rw,remount,rw /system";


echo "-----------------------------";
echo "----remove old apps ---------";
echo "-----------------------------";

su -c "rm -rf /system/priv-app/GmsCore";
su -c "rm -rf /system/priv-app/GmsCoreSetupPrebuilt";
su -c "rm -rf /system/priv-app/GoogleServicesFramework";
su -c "rm -rf /system/priv-app/Phonesky";


echo "-----------------------------";
echo "Installing the new apps...---";
echo "-----------------------------";

su -c "mkdir -p /system/priv-app/GoogleChrome";
su -c "mkdir -p /system/priv-app/GoogleTts";
su -c "mkdir -p /system/priv-app/GoogleApp";

su -c "mv /data/data/pl.sviete.dom/files/usr/tmp/GoogleChrome.apk /system/priv-app/GoogleChrome";
su -c "mv /data/data/pl.sviete.dom/files/usr/tmp/GoogleTts.apk /system/priv-app/GoogleTts";
su -c "mv /data/data/pl.sviete.dom/files/usr/tmp/GoogleApp.apk /system/priv-app/GoogleApp";

su -c "chown root:root /system/priv-app/GoogleChrome/GoogleChrome.apk";
su -c "chown root:root /system/priv-app/GoogleTts/GoogleTts.apk";
su -c "chown root:root /system/priv-app/GoogleApp/GoogleApp.apk";

su -c "chmod 644 /system/priv-app/GoogleChrome/GoogleChrome.apk";
su -c "chmod 644 /system/priv-app/GoogleTts/GoogleTts.apk";
su -c "chmod 644 /system/priv-app/GoogleApp/GoogleApp.apk";

echo "-----------------------------"
echo "----mount system to read ----"
echo "-----------------------------"

su -c "mount -o ro,remount,ro /system";
