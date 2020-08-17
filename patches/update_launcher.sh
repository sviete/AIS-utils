#
#   AIS dom update launcher script
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/update_launcher.sh | bash


echo "-----------------------------";
echo "Downloading launcher apk     ";
echo "-----------------------------";
curl -o "/sdcard/AisLauncher.apk" -L https://powiedz.co/ota/android/AisLauncher.apk &&

echo "---------------------------------";
echo "Uninstall AisLauncher.apk----------";
echo "---------------------------------";
su -c "pm uninstall launcher.sviete.pl.domlauncherapp" &&

echo "---------------------------------";
echo "Install AisLauncher.apk----------";
echo "---------------------------------";
su -c "pm install /sdcard/AisLauncher.apk" &&

echo "---------------------------------";
echo "Remove AisLauncher.apk-----------";
echo "---------------------------------";
su -c "rm /sdcard/AisLauncher.apk" &&

# Success
exit 0;
