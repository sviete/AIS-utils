# Scripts to install AIS releases


## On AIS PRO1

`` bash
git clone --depth=1 https://github.com/sviete/AIS-home-assistant.git
cd AIS-home-assistant
export CRYPTOGRAPHY_DONT_BUILD_RUST=1
pip wheel . -w wheels
pip wheel python-miio==0.5.8 -w wheels
cp requirements.txt wheels
cd wheels
rename cp39-cp39-linux_armv7l py3-none-any *

sed -i '1d' requirements.txt
echo \ >> requirements.txt
echo ais-dom==2021.10.0b9 >> requirements.txt
cd ..
7za a -m0=lzma2 2021.10_wheelhouse.tar.7z wheels
cd ~
git clone --depth=1 https://github.com/sviete/AIS-utils.git
cd AIS-utils
cp ~/AIS-home-assistant/2021.10_wheelhouse.tar.7z releases/2021
git add --all
git commit -m '2021.10_wheelhouse.tar.7z'
git push
``


## On AIS

`` bash
curl -o "/data/data/pl.sviete.dom/files/home/AIS/2021.10_wheelhouse.tar.7z" -L  https://github.com/sviete/AIS-utils/blob/master/releases/2021/2021.10_wheelhouse.tar.7z?raw=true
7z x -mmt=2 -o/data/data/pl.sviete.dom/files/home/AIS/ /data/data/pl.sviete.dom/files/home/AIS/2021.10_wheelhouse.tar.7z -y
cd /data/data/pl.sviete.dom/files/home/AIS
pip install -r wheels/requirements.txt --no-index --find-links wheels/
``
