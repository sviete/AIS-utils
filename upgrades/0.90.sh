#
#   AIS dom upgrade script to version 0.90.x
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/upgrades/0.90.sh | bash
################################################
echo "-----------------------------"
echo "-----------------------------"
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom upgrade to version 0.90.x"
echo "-----------------------------"
echo "-----------------------------"
curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Start aktualizacji do wersji 0.90 To potrwa 20 minut. Poczekaj."}' http://localhost:8122/text_to_speech &&

# remove the db
rm /data/data/pl.sviete.dom/files/home/AIS/home-assistant_v2.db

echo "-----------------------------";
echo "Downloading lovelace json----";
echo "-----------------------------";
curl -o "/data/data/pl.sviete.dom/files/home/AIS/.storage/lovelace" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/lovelace &&


apt update &&
apt install rclone -y &&

curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Poczekaj na koniec aktualizacji i restart."}' http://localhost:8122/text_to_speech &&

echo "Grants for storage to domlauncherapp" &&
echo "We need both read & write permission, then saving to getExternalStorageDirectory works." &&
su -c "pm grant launcher.sviete.pl.domlauncherapp android.permission.READ_EXTERNAL_STORAGE" &&
su -c "pm grant launcher.sviete.pl.domlauncherapp android.permission.WRITE_EXTERNAL_STORAGE" &&

echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
