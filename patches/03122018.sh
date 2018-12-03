#
#   AIS dom
#
#   Homepage: https://ai-speaker.com
#
################################################
#  Remove Google Play script,                  #
#  run it by executiong in AIS dom console:
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/03122018.sh | bash
#
################################################
set -e

echo "-----------------------------";
echo "Downloading main script------";
echo "-----------------------------";


curl -o "/data/data/pl.sviete.dom/files/usr/tmp/remove_google_play.sh" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/remove_google_play.sh;

echo "-----------------------------";
echo "chmod------------------------";
echo "-----------------------------";

chmod 777 /data/data/pl.sviete.dom/files/usr/tmp/remove_google_play.sh;


echo "-----------------------------";
echo "execute----------------------";
echo "-----------------------------";

/data/data/pl.sviete.dom/files/usr/tmp/remove_google_play.sh;

echo "-----------------------------";
echo "remove script----------------";
echo "-----------------------------";

rm /data/data/pl.sviete.dom/files/usr/tmp/remove_google_play.sh;


echo "-------count to 10 and restart--------";
sleep 1
echo "1";
sleep 1
echo "2";
sleep 1
echo "3";
sleep 1
echo "4";
sleep 1
echo "5";
sleep 1
echo "6";
sleep 1
echo "7";
sleep 1
echo "8";
sleep 1
echo "9";
sleep 1
echo "10";
sleep 1
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M')
echo "----ALL OK END -> RESTART----"
echo "-----------------------------"

echo "-----------------------------";
echo "reboot ----------------------";
echo "-----------------------------";

su -c "reboot now"

# Success
exit 0;
