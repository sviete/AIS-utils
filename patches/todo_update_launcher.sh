
# TODO
su -c "pm uninstall launcher.sviete.pl.domlauncherapp"
curl -o "/sdcard/AisLauncher.apk" -L https://powiedz.co/ota/android/AisLauncher.apk
su -c "pm install -r /sdcard/AisLauncher.apk"
