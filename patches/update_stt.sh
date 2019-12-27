#
#   AIS dom update stt script
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/update_stt.sh | bash


echo "-----------------------------";
echo "Downloading stt apk----------";
echo "-----------------------------";
curl -o "/sdcard/GoogleApp.apk" -L https://powiedz.co/ota/android/GoogleApp.apk &&


echo "---------------------------------";
echo "Install stt apk------------------";
echo "---------------------------------";
su -c "pm install -r /sdcard/GoogleApp.apk" &&

echo "---------------------------------";
echo "Remove stt apk-------------------";
echo "---------------------------------";
su -c "rm /sdcard/GoogleApp.apk" &&

# Success
exit 0;
