#
#   AIS dom upgrade script to version 0.80.x
#
#   Homepage: https://ai-speaker.com
#

################################################
# 1. Download and extract Caddy HTTP server    #
################################################

echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom upgrade to version 0.80.x"
echo "-----------------------------"

curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Start aktualizacji do wersji 0.80. To potrwa 5 minut. Poczekaj."}' http://localhost:8122/text_to_speech &&

echo "-----------------------------"
echo "apt install libxslt-dev"
apt install -y libxslt-dev

echo "-----------------------------"
echo "Downloading Caddy for AIS dom"
echo "-----------------------------"

# Use $PREFIX for compatibility with AIS dom on Android
dl="$PREFIX/tmp/caddy.tar.gz"
rm -rf -- "$dl"

curl -o "$dl" -L https://raw.githubusercontent.com/sviete/AIS-utils/master/caddy/caddy_v0.11.0_linux_arm7.tar.gz

echo "-----------------------------"
echo "Extracting..."
echo "-----------------------------"

tar xf "$dl" -C "$PREFIX/tmp/"
chmod +x "$PREFIX/tmp/caddy"
chmod 777 "$PREFIX/tmp/Caddyfile"

echo "-----------------------------"
echo "Putting caddy in bin path"
echo "-----------------------------"

mv "$PREFIX/tmp/caddy" "$PREFIX/bin/caddy"
mv "$PREFIX/tmp/Caddyfile" "$PREFIX/bin/Caddyfile"
rm -rf "$dl"


echo "-----------------------------"
echo "pm2 part"
echo "-----------------------------"
echo "inception... go deeper..."
ssh localhost -o StrictHostKeyChecking=no -p 8022 -i /data/data/pl.sviete.dom/files/home/AIS/www/id_rsa_ais << EOF
pm2 delete http
pm2 start caddy --name http -- -conf "$PREFIX/bin/Caddyfile"
pm2 save
EOF
echo "inception... go back"


echo "-----------------------------"
echo "check installation"
caddy -version
echo "-----------------------------"

echo "-----------------------------"
echo "Successfully installed, your HTTP server is ready on http://ais-dom:8180"
echo "-----------------------------"



# ################################################
#   AIS dom upgrade script to version 0.87.x
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/upgrades/0.87.sh | bash
################################################
echo "-----------------------------"
echo "-----------------------------"
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom upgrade to version 0.87.x"
echo "-----------------------------"
echo "-----------------------------"
curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Start aktualizacji do wersji 0.87.3. To potrwa 30 minut. Poczekaj."}' http://localhost:8122/text_to_speech &&
echo "-----------------------------"
echo "-----------------------------";
echo "Install make and git---------";
echo "-----------------------------";
apt -y install make git &&
curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Aktualizacja, mamy 5%"}' http://localhost:8122/text_to_speech &&
echo "-----------------------------";
echo "Install pynacl and webssh----";
echo "-----------------------------";
cd ~
git clone https://github.com/araczkowski/pynacl.git
cd pynacl
curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Kompilacja. Ten krok potrwa 15 minut. Poczekaj."}' http://localhost:8122/text_to_speech &&
python setup.py install
cd ~
rm -rf pynacl
curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Aktualizacja, mamy 55%"}' http://localhost:8122/text_to_speech &&
git clone https://github.com/araczkowski/webssh.git
cd webssh
python setup.py install
cd ~
rm -rf webssh
echo "We will generate ssh id_rsa private key file now..."
cd ~/.ssh
rm rsa-key
rm rsa-key.pub
ssh-keygen -m PEM -t rsa -f rsa-key -N ""
cat ~/.ssh/rsa-key.pub >> ~/.ssh/authorized_keys
sed -i -e '$a\' ~/.ssh/authorized_keys
echo "RSA key generation done"


echo "-----------------------------";
echo "Install pm service ----------";
echo "-----------------------------";
echo "inception... go deeper..."
ssh localhost -o StrictHostKeyChecking=no -p 8022 -i /data/data/pl.sviete.dom/files/home/AIS/www/id_rsa_ais << EOF
pm2 delete webssh
pm2 start wssh --name webssh --interpreter=python
pm2 save
npm install -g dom-tunnel
EOF
echo "inception... go back"
curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Aktualizacja, mamy 65%"}' http://localhost:8122/text_to_speech &&

echo "-----------------------------";
echo "Downloading lovelace json----";
echo "-----------------------------";
curl -o "/data/data/pl.sviete.dom/files/home/AIS/.storage/lovelace" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/lovelace
curl -o "/data/data/pl.sviete.dom/files/home/.bash_profile" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/.bash_profile
chmod +x /data/data/pl.sviete.dom/files/home/.bash_profile
curl -o "/data/data/pl.sviete.dom/files/usr/etc/motd" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/motd
echo "-----------------------------";
echo "Upgrade pip------------------";
echo "-----------------------------";
pip install pip -U;

echo "-----------------------------"
echo "-----------------------------"
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom upgrade to version 0.89.x"
echo "-----------------------------"
echo "-----------------------------"
curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Start aktualizacji do wersji 0.89.2. Poczekaj."}' http://localhost:8122/text_to_speech &&


echo "-----------------------------";
echo "Downloading aps for AIS dom";
echo "-----------------------------";
curl -o "/sdcard/Spotify.apk" -L https://powiedz.co/ota/android/Spotify.apk &&


curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Instaluje Spotify."}' http://localhost:8122/text_to_speech &&
echo "-----------------------------";
echo "Install Spotify.apk----------";
echo "-----------------------------";
su -c "pm install -r /sdcard/Spotify.apk && mount -o rw,remount,rw /system && sed -i '/ro.product.model=/d' '/system/build.prop' && echo 'ro.product.model=AI-Speaker.com' >> /system/build.prop && sed -i '/ro.platform.support.over.4k30/d' '/system/build.prop' &&  echo 'ro.platform.support.over.4k30=false' >> /system/build.prop && mount -o ro,remount,ro /system" &&

curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Aktualizacja wykonana, poczekaj na restart."}' http://localhost:8122/text_to_speech &&

echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
