#
#   AIS dom
#
#   Homepage: https://ai-speaker.com
#
################################################
#  Remove Google Play
################################################


echo "Downloading aps for AIS dom";
echo "-----------------------------";


curl -o "/data/data/pl.sviete.dom/files/usr/tmp/GoogleApp.apk" -L https://powiedz.co/ota/android/GoogleApp.apk;
curl -o "/data/data/pl.sviete.dom/files/usr/tmp/GoogleTts.apk" -L https://powiedz.co/ota/android/GoogleTts.apk;
curl -o "/data/data/pl.sviete.dom/files/usr/tmp/GoogleChrome.apk" -L https://powiedz.co/ota/android/GoogleChrome.apk;


echo "----mount system to write----";
echo "-----------------------------";

su -c "mount -o rw,remount,rw /system";


echo "----remove old apps ---------";
echo "-----------------------------";

su -c "rm -rf /system/priv-app/GmsCore";
su -c "rm -rf /system/priv-app/GmsCoreSetupPrebuilt";
su -c "rm -rf /system/priv-app/GoogleServicesFramework";
su -c "rm -rf /system/priv-app/Phonesky";
su -c "rm -rf /system/priv-app/*.apk";


echo "Installing the new apps...---";
echo "-----------------------------";

su -c "mkdir -p /system/priv-app/GoogleChrome";
su -c "mkdir -p /system/priv-app/GoogleTts";
su -c "mkdir -p /system/priv-app/GoogleApp";

su -c "mv /data/data/pl.sviete.dom/files/usr/tmp/GoogleChrome.apk /system/priv-app/GoogleChrome";
su -c "mv /data/data/pl.sviete.dom/files/usr/tmp/GoogleTts.apk /system/priv-app/GoogleTts";
su -c "mv /data/data/pl.sviete.dom/files/usr/tmp/GoogleApp.apk /system/priv-app/GoogleApp";


echo "set the perimitions...-------";
echo "-----------------------------";

su -c "chown root:root /system/priv-app/GoogleChrome";
su -c "chown root:root /system/priv-app/GoogleTts";
su -c "chown root:root /system/priv-app/GoogleApp";
su -c "chown root:root /system/priv-app/GoogleChrome/GoogleChrome.apk";
su -c "chown root:root /system/priv-app/GoogleTts/GoogleTts.apk";
su -c "chown root:root /system/priv-app/GoogleApp/GoogleApp.apk";

su -c "chmod 755 /system/priv-app/GoogleChrome";
su -c "chmod 755 /system/priv-app/GoogleTts";
su -c "chmod 755 /system/priv-app/GoogleApp";
su -c "chmod 644 /system/priv-app/GoogleChrome/GoogleChrome.apk";
su -c "chmod 644 /system/priv-app/GoogleTts/GoogleTts.apk";
su -c "chmod 644 /system/priv-app/GoogleApp/GoogleApp.apk";

echo "-------count to 10 and restart--------";
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
