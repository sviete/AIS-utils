#
#   AIS dom upgrade script to version 0.91.x
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/upgrades/0.91.sh | bash
################################################
echo "-----------------------------"
echo "-----------------------------"
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom upgrade to version 0.91.x"
echo "-----------------------------"
echo "-----------------------------"
curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Start aktualizacji do wersji 0.91 To potrwa 20 minut. Poczekaj."}' http://localhost:8122/text_to_speech &&

echo "-----------------------------";
echo "Downloading lovelace json----";
echo "-----------------------------";
# curl -o "/data/data/pl.sviete.dom/files/home/AIS/.storage/lovelace" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/lovelace_0.91 &&
echo "-----------------------------";
echo "Downloading aps for AIS dom";
echo "-----------------------------";
curl -o "/sdcard/ais-dom-0.91.0.tar.gz" -L https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/ais-dom-0.91.0.tar.gz &&

curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Instaluje"}' http://localhost:8122/text_to_speech &&

pip install /sdcard/ais-dom-0.91.0.tar.gz -U &&

curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Zainstalowane, poczekaj na koniec aktualizacji i restart."}' http://localhost:8122/text_to_speech &&

curl -o "/sdcard/AisPanelApp-test.apk" -L https://powiedz.co/ota/android/AisPanelApp-test.apk &&
su -c "pm install -r /sdcard/AisPanelApp-test.apk" &&


echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
