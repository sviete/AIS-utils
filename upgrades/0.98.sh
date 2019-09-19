#
#   AIS dom upgrade script to version 0.98.x
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/upgrades/0.98.sh | bash
################################################
echo "-----------------------------"
echo "-----------------------------"
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom upgrade to version 0.98.x"
echo "-----------------------------"
echo "-----------------------------"


curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Start aktualizacji. To potrwa 20 minut. Poczekaj."}' http://localhost:8122/text_to_speech &&



# remove the  spotify cache
rm -rf /sdcard/Android/data/com.spotify.music/files/spotifycache


# pip
curl -o "/sdcard/ais-dom.tar.gz" -L https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/ais-dom-0.98.9.tar.gz &&
pip install /sdcard/ais-dom.tar.gz -U &&


# echo "-----------------------------";
# echo "Downloading lovelace json----";
# echo "-----------------------------";
curl -o "/data/data/pl.sviete.dom/files/home/AIS/.storage/lovelace" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/lovelace &&
# echo "-----------------------------";
# echo "-----------------------------";

curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"poczekaj na koniec aktualizacji i restart."}' http://localhost:8122/text_to_speech &&


echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
