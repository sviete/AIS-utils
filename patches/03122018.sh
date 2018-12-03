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

/data/data/pl.sviete.dom/files/usr/tmp/remove_google_play.sh

echo "-----------------------------";
echo "remove script----------------";
echo "-----------------------------";

rm /data/data/pl.sviete.dom/files/usr/tmp/remove_google_play.sh;


echo "-----------------------------";
echo "reboot ----------------------";
echo "-----------------------------";

su -c "reboot now"

# Success
exit 0;
