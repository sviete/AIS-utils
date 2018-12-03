#
#   AIS dom
#
#   Homepage: https://ai-speaker.com
#
################################################
#  Remove Google Play script,                  #
#  run it by executiong in AIS dom console:
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/03122018.sh | bash  >> /data/data/pl.sviete.dom/files/home/AIS/www/upgrade_log.txt
#
################################################


echo "-----------------------------";
echo "Downloading main script------";
echo "-----------------------------";


curl -o "/data/data/pl.sviete.dom/files/usr/tmp/remove_google_play.sh" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scrips/remove_google_play.sh;


echo "-----------------------------";
echo "chmod------------------------";
echo "-----------------------------";

chmod 777 /data/data/pl.sviete.dom/files/usr/tmp/remove_google_play.sh;


echo "-----------------------------";
echo "execute----------------------";
echo "-----------------------------";

/data/data/pl.sviete.dom/files/usr/tmp/remove_google_play.sh;

echo "-----------------------------";
echo "remove-----------------------";
echo "-----------------------------";

rm /data/data/pl.sviete.dom/files/usr/tmp/remove_google_play.sh;


echo "-----------------------------";
echo "---- reboot------------------";
echo "-----------------------------";

su -c "reboot";
