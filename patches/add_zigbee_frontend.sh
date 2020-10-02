#
#   AIS dom
#
#   Homepage: https://ai-speaker.com
#
################################################
#  Add zigbee frontend script
#  run it by executiong in AIS dom console:
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/add_zigbee_frontend.sh | bash
#
################################################
set -e

echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M')
echo "----ADD ZIGBEE FRONTEND START ----"
echo "-----------------------------"

# bash
string1="frontend"
string2="experimental"
file="/data/data/pl.sviete.dom/files/home/zigbee2mqtt/data/configuration.yaml"
if grep -q "$string" "$file" ; then
  echo "Configuration without frontend - adding"
  echo "" >> $file
  echo "frontend:" >> $file
  echo "  port: 8099" >> $file
fi
if grep -q "$string2" "$file" ; then
  echo "Configuration without new_api - adding"
  echo "" >> $file
  echo "experimental:" >> $file
  echo "  new_api: true" >> $file
fi
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M')
echo "----ALL OK END----"
echo "-----------------------------"
