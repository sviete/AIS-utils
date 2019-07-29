#
#   AIS dom upgrade script to version 0.96.x
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/upgrades/0.96.sh | bash
################################################
echo "-----------------------------"
echo "-----------------------------"
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom upgrade to version 0.96.x"
echo "-----------------------------"
echo "-----------------------------"


curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Start aktualizacji do wersji 0.96 To potrwa 20 minut. Poczekaj."}' http://localhost:8122/text_to_speech &&


echo "-----------------------------";
echo "Downloading lovelace json----";
echo "-----------------------------";
curl -o "/data/data/pl.sviete.dom/files/home/AIS/.storage/lovelace" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/lovelace_0.96 &&
echo "-----------------------------";
echo "-----------------------------";


# remove the  spotify cache
rm -rf /sdcard/Android/data/com.spotify.music/files/spotifycache

# pip
curl -o "/sdcard/ais-dom.tar.gz" -L https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/ais-dom-0.96.5.tar.gz &&
pip install /sdcard/ais-dom.tar.gz -U &&

curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"poczekaj na koniec aktualizacji i restart."}' http://localhost:8122/text_to_speech &&


echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
