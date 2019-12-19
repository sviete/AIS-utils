#
#   AIS dom
#
#   Homepage: https://ai-speaker.com
#
################################################
#  Add zigbee script
#  run it by executiong in AIS dom console:
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/add_zigbee.sh | bash
#
################################################
set -e

# bash
curl -o "/data/data/pl.sviete.dom/files/home/.bash_profile" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/.bash_profile
chmod +x /data/data/pl.sviete.dom/files/home/.bash_profile
