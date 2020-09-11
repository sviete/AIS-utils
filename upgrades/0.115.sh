#
#   AIS dom upgrade script to version 0.115.x
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/upgrades/0.115.sh | bash
################################################
echo "-----------------------------"
echo "-----------------------------"
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom upgrade to version 0.115.x"
echo "-----------------------------"
echo "-----------------------------"


curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Dodaje biblioteke audio. Poczekaj."}' http://localhost:8122/text_to_speech


# remove the dyski-zewnętrzne folder if exists
rm -rf /data/data/pl.sviete.dom/files/home/dom/dyski-zewnętrzne

# create symbolic link for dom dolder
ln -s /data/data/pl.sviete.dom/files/home/dom /data/data/pl.sviete.dom/files/home/AIS/media 

echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
