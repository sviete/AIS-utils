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

rm -rf "/data/data/pl.sviete.dom/files/usr/tmp/GoogleApp.apk";
rm -rf "/data/data/pl.sviete.dom/files/usr/tmp/GoogleTts.apk";
rm -rf "/data/data/pl.sviete.dom/files/usr/tmp/GoogleChrome.apk";

curl -o "/data/data/pl.sviete.dom/files/usr/tmp/GoogleApp.apk" -L https://powiedz.co/ota/android/GoogleApp.apk;
curl -o "/data/data/pl.sviete.dom/files/usr/tmp/GoogleTts.apk" -L https://powiedz.co/ota/android/GoogleTts.apk;
curl -o "/data/data/pl.sviete.dom/files/usr/tmp/GoogleChrome.apk" -L https://powiedz.co/ota/android/GoogleChrome.apk;


echo "-----------------------------";
echo "----mount system to write----";
echo "-----------------------------";

mount -o rw,remount,rw /system;


echo "-----------------------------";
echo "----remove old apps ---------";
echo "-----------------------------";

rm -rf /system/priv-app/GmsCore;
rm -rf /system/priv-app/GmsCoreSetupPrebuilt;
rm -rf /system/priv-app/GoogleServicesFramework;
rm -rf /system/priv-app/Phonesky;


echo "-----------------------------";
echo "Installing the new apps...---";
echo "-----------------------------";

mkdir -p /system/priv-app/GoogleChrome;
mkdir -p /system/priv-app/GoogleTts;
mkdir -p /system/priv-app/GoogleApp;

mv /data/data/pl.sviete.dom/files/usr/tmp/GoogleChrome.apk /system/priv-app/GoogleChrome;
mv /data/data/pl.sviete.dom/files/usr/tmp/GoogleTts.apk /system/priv-app/GoogleTts;
mv /data/data/pl.sviete.dom/files/usr/tmp/GoogleApp.apk /system/priv-app/GoogleApp;

chown root:root /system/priv-app/GoogleChrome/GoogleChrome.apk
chown root:root /system/priv-app/GoogleTts/GoogleTts.apk
chown root:root /system/priv-app/GoogleApp/GoogleApp.apk

chmod 644 /system/priv-app/GoogleChrome/GoogleChrome.apk
chmod 644 /system/priv-app/GoogleTts/GoogleTts.apk
chmod 644 /system/priv-app/GoogleApp/GoogleApp.apk

echo "-----------------------------"
echo "----mount system to read ----"
echo "-----------------------------"

mount -o ro,remount,ro /system
