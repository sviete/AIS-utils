#
#   AIS dom upgrade script to version 0.99.x
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/upgrades/0.99.sh | bash
################################################
echo "-----------------------------"
echo "-----------------------------"
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom upgrade to version 0.99.x"
echo "-----------------------------"
echo "-----------------------------"


curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Start aktualizacji. To potrwa 20 minut. Poczekaj."}' http://localhost:8122/text_to_speech &&



# remove the  spotify cache
rm -rf /sdcard/Android/data/com.spotify.music/files/spotifycache


# pip
curl -o "/sdcard/ais-dom.tar.gz" -L https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/ais-dom-0.99.3.tar.gz &&
pip install /sdcard/ais-dom.tar.gz -U &&


curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"poczekaj na koniec aktualizacji i restart."}' http://localhost:8122/text_to_speech &&

echo "Grants for storage to domlauncherapp" &&
echo "We need both read & write permission, then saving to getExternalStorageDirectory works." &&
su -c "pm grant launcher.sviete.pl.domlauncherapp android.permission.READ_EXTERNAL_STORAGE" &&
su -c "pm grant launcher.sviete.pl.domlauncherapp android.permission.WRITE_EXTERNAL_STORAGE" &&

echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
