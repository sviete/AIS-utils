#
#   AIS dom upgrade script to version 0.88.x
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/upgrades/0.88.sh | bash
################################################
echo "-----------------------------"
echo "-----------------------------"
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom upgrade to version 0.87.x"
echo "-----------------------------"
echo "-----------------------------"
curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Start aktualizacji. To potrwa 10 minut. Poczekaj."}' http://localhost:8122/text_to_speech &&


echo "Install ais-dom--------------";
echo "-----------------------------";
curl -o "/sdcard/ais-dom-0.88.2.tar.gz" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/ais-dom-0.88.2.tar.gz;
pip install /sdcard/ais-dom-0.88.2.tar.gz -U;
echo "-----------------------------";
curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Aktualizacja wykonana, poczekaj na restart."}' http://localhost:8122/text_to_speech &&

echo "Model name to build.prop start"
su -c "mount -o rw,remount,rw /system && sed -i '/ro.product.model=p281/d' '/system/build.prop' &&  echo 'ro.product.model=AI-Speaker.com' >> /system/build.prop && mount -o ro,remount,ro /system && echo 'done'"
echo "Model name to build.prop done"

echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
