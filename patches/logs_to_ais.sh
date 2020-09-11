#
#   AIS dom send logs to AIS
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/logs_to_ais.sh | bash


echo "-----------------------------"
echo "-----------------------------"
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS collecting logs...       "
echo "-----------------------------"
echo "-----------------------------"

GATE=$( cat ~/AIS/.dom/.ais_secure_android_id_dom)
# echo $GATE
echo "Generic.kl for gate"
curl -X POST -H "Content-Type: text/xml" --data "@/system/usr/keylayout/Generic.kl" http://powiedz.co/ords/dom/dom/logs?id=$GATE

echo "logcat for gate"
su -c 'logcat' > $TMPDIR/log.txt &
sleep 5
curl  -X POST -H "Content-Type: text/xml" --data "@$TMPDIR/log.txt" http://powiedz.co/ords/dom/dom/logs?id=$GATE

echo "packages on gate"
su -c 'dumpsys package packages' > $TMPDIR/packages.txt &
sleep 5
curl -X POST -H "Content-Type: text/xml" --data "@$TMPDIR/packages.txt" http://powiedz.co/ords/dom/dom/logs?id=$GATE

echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP

# Success
exit 0;
