#!/data/data/pl.sviete.dom/files/usr/bin/bash
#
#   AIS
#
#   Homepage: https://ai-speaker.com
#
################################################
#  Change generic key layout
#  run it by executiong in AIS dom console:
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/linux/update_ais_keylayout.sh | bash
#
echo "AIS Download Generic.kl START"
curl -o "/sdcard/Generic.kl" -L https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/Generic.kl
echo " "
su -c "mount -o rw,remount,rw /system && cp /sdcard/Generic.kl /system/usr/keylayout/Generic.kl && rm /sdcard/Generic.kl && mount -o ro,remount,ro /system && echo done"
echo "AIS Download Generic.kl DONE"
