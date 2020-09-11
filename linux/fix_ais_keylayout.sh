#!/data/data/pl.sviete.dom/files/usr/bin/bash
#   AIS
#   Homepage: https://ai-speaker.com
################################################
#  Fix key layout
#  run it by executiong in AIS dom console:
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/linux/fix_ais_keylayout.sh | bash
#

echo "AIS fix key layout  START"
server_version=$(su -c 'dumpsys package pl.sviete.dom | grep versionCode' | egrep -o '[[:digit:]]{3}' | head -n1)
echo "Detected AIS dom server version: $server_version"
echo "checking keylayout"
string="orginal"
file="/system/usr/keylayout/Generic.kl"
if grep -q "$string" "$file" ; then
  echo "OLD keylayout"
  if [ "$server_version" -gt "200" ] ; then
    echo "need to apply NEW keylayout"
    echo "AIS Download Generic.kl START"
    curl -o "/sdcard/Generic.kl" -L https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/Generic.kl
    echo " "
    su -c "mount -o rw,remount,rw /system && cp /sdcard/Generic.kl /system/usr/keylayout/Generic.kl && rm /sdcard/Generic.kl && mount -o ro,remount,ro /system && echo done"
  else
    echo "ALL OK"
  fi
else
  echo "we have NEW keylayout"
  if [ "$server_version" -lt "200" ] ; then
    echo "need to apply OLD keylayout"
    echo "AIS Download OLD Generic.kl START"
    curl -o "/sdcard/Generic.kl" -L https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/OLD_Generic.kl
    echo " "
    su -c "mount -o rw,remount,rw /system && cp /sdcard/Generic.kl /system/usr/keylayout/Generic.kl && rm /sdcard/Generic.kl && mount -o ro,remount,ro /system && echo done"
  else
    echo "ALL OK"
  fi
fi

echo "All done OK. AIS"
