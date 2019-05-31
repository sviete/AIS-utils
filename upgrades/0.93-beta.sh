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
echo "AIS dom upgrade to version 0.93.x"
echo "-----------------------------"
echo "-----------------------------"


curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Start aktualizacji do wersji 0.93.4 To potrwa 20 minut. Poczekaj."}' http://localhost:8122/text_to_speech &&

echo "-----------------------------";
echo "Downloading lovelace json----";
echo "-----------------------------";
curl -o "/data/data/pl.sviete.dom/files/home/AIS/.storage/lovelace" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/lovelace_0.93 &&
echo "-----------------------------";
echo "-----------------------------";


# remove the  spotify cache
rm -rf /sdcard/Android/data/com.spotify.music/files/spotifycache

curl -o "/sdcard/ais-dom-0.93.4.tar.gz" -L https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/ais-dom-0.93.4.tar.gz &&
curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Instalacja systemu Asystent domowy"}' http://localhost:8122/text_to_speech &&
pip install /sdcard/ais-dom-0.93.4.tar.gz -U &&


echo "-----------------------------------";
echo "fix webssh in pm service ----------";
echo "-----------------------------------";
echo "inception... go deeper..."
ssh localhost -o StrictHostKeyChecking=no -p 8022 -i /data/data/pl.sviete.dom/files/home/AIS/www/id_rsa_ais << EOF
pm2 delete webssh
pm2 start wssh --name webssh --interpreter=python -- --xsrf=False
pm2 delete http
pm2 save
EOF
echo "inception... go back"

echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
