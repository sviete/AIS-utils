#
#   AIS dom upgrade script to version 0.94.x
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/upgrades/0.94.sh | bash
################################################
echo "-----------------------------"
echo "-----------------------------"
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom upgrade to version 0.94.x"
echo "-----------------------------"
echo "-----------------------------"


curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Start aktualizacji do wersji 0.94 To potrwa 20 minut. Poczekaj."}' http://localhost:8122/text_to_speech &&


echo "-----------------------------";
echo "Enable config from UI -------";
echo "-----------------------------";
sed -i '/homeassistant:/,/frontend:/c\homeassistant:\n  customize: !include customize.yaml\n\nfrontend:' /data/data/pl.sviete.dom/files/home/AIS/configuration.yaml
echo "-----------------------------";
echo "-----------------------------";

echo "-----------------------------";
echo "Downloading lovelace json----";
echo "-----------------------------";
curl -o "/data/data/pl.sviete.dom/files/home/AIS/.storage/lovelace" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/lovelace_0.94 &&
echo "-----------------------------";
echo "-----------------------------";


# remove the  spotify cache
rm -rf /sdcard/Android/data/com.spotify.music/files/spotifycache

# pip
curl -o "/sdcard/ais-dom.tar.gz" -L https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/ais-dom-0.94.4.tar.gz &&
pip install /sdcard/ais-dom.tar.gz -U &&

curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"poczekaj na koniec aktualizacji i restart."}' http://localhost:8122/text_to_speech &&



#echo "-----------------------------";
#echo "Downloading aps for AIS dom";
#echo "-----------------------------";
#curl -o "/sdcard/AisPanelApp.apk" -L https://raw.githubusercontent.com/sviete/AIS-utils/master/android/apks/AisPanelApp-0.94.apk &&


#curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Instaluje aplikacje android."}' http://localhost:8122/text_to_speech &&
# echo "-----------------------------";
# echo "Install AisPanelApp.apk----------";
#echo "-----------------------------";
#su -c "pm install -r /sdcard/AisPanelApp.apk" &&


echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
