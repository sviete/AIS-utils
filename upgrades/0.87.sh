#
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

curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Aktualizacja Asystenta domowego, mamy 75%, poczekaj na restart."}' http://localhost:8122/text_to_speech &&
echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
