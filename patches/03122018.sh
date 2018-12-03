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

echo "chmod------------------------";
echo "-----------------------------";

chmod 777 /data/data/pl.sviete.dom/files/usr/tmp/remove_google_play.sh;


echo "execute main script----------";
echo "-----------------------------";

/data/data/pl.sviete.dom/files/usr/tmp/remove_google_play.sh;

echo "remove main script-----------";
echo "-----------------------------";

rm /data/data/pl.sviete.dom/files/usr/tmp/remove_google_play.sh;
