# Scripts to install AIS releases


## On AIS PRO1

`` bash
git clone --depth=1 https://github.com/sviete/AIS-home-assistant.git
cd AIS-home-assistant
export CRYPTOGRAPHY_DONT_BUILD_RUST=1
pip wheel . -w wheels
7za a -m0=lzma2 2021.10_wheelhouse.tar.7z wheels
cd ~
git clone --depth=1 https://github.com/sviete/AIS-utils.git
cp ~/2021.10_wheelhouse.tar.7z wheels releases/2021
``


## On AIS

```
tar zxf archive.tar.gz
pip install -r requirements.txt --use-wheel --no-index --find-links wheelhouse
```
