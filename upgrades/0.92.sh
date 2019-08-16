#
#   AIS dom upgrade script to version 0.92.x
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/upgrades/0.92.sh | bash
################################################
echo "-------------------------------"
echo "-------------------------------"
echo "-------------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-------------------------------"
echo "AIS dom upgrade to version 0.92"
echo "-------------------------------"
echo "-------------------------------"


curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Start aktualizacji do wersji 0.92 To potrwa 20 minut. Poczekaj."}' http://localhost:8122/text_to_speech &&

# remove the db and spotifycache
rm /data/data/pl.sviete.dom/files/home/AIS/home-assistant_v2.db
rm -rf /sdcard/Android/data/com.spotify.music/files/spotifycache

echo "-------------------------------";
echo "Downloading lovelace json------";
echo "-------------------------------";
curl -o "/data/data/pl.sviete.dom/files/home/AIS/.storage/lovelace" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/lovelace &&
echo "-------------------------------";
echo "-------------------------------";

echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
