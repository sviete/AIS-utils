#
#   AIS dom update tts script
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/update_tts.sh | bash


echo "-----------------------------";
echo "Downloading tts apk----------";
echo "-----------------------------";
curl -o "/sdcard/GoogleTts.apk" -L https://powiedz.co/ota/android/GoogleTts.apk &&


echo "---------------------------------";
echo "Install tts apk------------------";
echo "---------------------------------";
su -c "pm install -r /sdcard/GoogleTts.apk" &&

echo "---------------------------------";
echo "Remove tts apk-------------------";
echo "---------------------------------";
su -c "rm /sdcard/GoogleTts.apk" &&

# Success
exit 0;
