#!/data/data/pl.sviete.dom/files/usr/bin/bash
#   AIS
#   Homepage: https://ai-speaker.com
################################################
#  Fix key layout
#  run it by executiong in AIS dom console:
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/releases/2021/ais-dom==2021.10.sh | bash
#

echo "AIS 2021.10 installation START"
curl -o "/data/data/pl.sviete.dom/files/home/AIS/2021.10_wheelhouse.tar.7z" -L  https://github.com/sviete/AIS-utils/blob/master/releases/2021/2021.10_wheelhouse.tar.7z?raw=true
7z x -mmt=2 -o/data/data/pl.sviete.dom/files/home/AIS/ /data/data/pl.sviete.dom/files/home/AIS/2021.10_wheelhouse.tar.7z -y
cd /data/data/pl.sviete.dom/files/home/AIS
pip install -r wheels/requirements.txt --no-index --find-links wheels/
echo "All done OK. AIS"
