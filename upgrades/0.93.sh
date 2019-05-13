#
#   AIS dom upgrade script to version 0.93.x
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/upgrades/0.93.sh | bash
################################################
echo "-----------------------------"
echo "-----------------------------"
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom upgrade to version 0.92.6"
echo "-----------------------------"
echo "-----------------------------"


curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Start aktualizacji do wersji 0.92.6 To potrwa 20 minut. Poczekaj."}' http://localhost:8122/text_to_speech &&

echo "-----------------------------";
echo "Downloading lovelace json----";
echo "-----------------------------";
# curl -o "/data/data/pl.sviete.dom/files/home/AIS/.storage/lovelace" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/lovelace_93 &&
echo "-----------------------------";
echo "-----------------------------";

curl -o "/sdcard/ais-dom-0.92.6.tar.gz" -L https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/ais-dom-0.92.6.tar.gz &&
pip install /sdcard/ais-dom-0.92.6.tar.gz -U &&
curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Zainstalowane, poczekaj na koniec aktualizacji i restart."}' http://localhost:8122/text_to_speech &&

echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
