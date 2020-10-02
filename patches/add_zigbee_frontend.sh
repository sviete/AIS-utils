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
if ! grep -qF "frontend" /data/data/pl.sviete.dom/files/home/zigbee2mqtt/data/configuration.yaml ; then
  echo "Configuration without frontend - adding"
  echo "" >> /data/data/pl.sviete.dom/files/home/zigbee2mqtt/data/configuration.yaml
  echo "frontend:" >> /data/data/pl.sviete.dom/files/home/zigbee2mqtt/data/configuration.yaml
  echo "  port: 8099" >> /data/data/pl.sviete.dom/files/home/zigbee2mqtt/data/configuration.yaml
  echo "experimental:" >> /data/data/pl.sviete.dom/files/home/zigbee2mqtt/data/configuration.yaml
  echo "  new_api: true" >> /data/data/pl.sviete.dom/files/home/zigbee2mqtt/data/configuration.yaml
fi

echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M')
echo "----ALL OK END----"
echo "-----------------------------"
