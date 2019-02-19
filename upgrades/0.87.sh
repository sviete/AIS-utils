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

echo "-----------------------------";
echo "Install make and git---------";
echo "-----------------------------";
apt -y install make git &&

echo "-----------------------------";
echo "Install pynacl and webssh----";
echo "-----------------------------";
cd ~
git clone https://github.com/araczkowski/pynacl.git
cd pynacl
python setup.py install
cd ~
rm -rf pynacl
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

echo "-----------------------------";
echo "Downloading lovelace json----";
echo "-----------------------------";
curl -o "/data/data/pl.sviete.dom/files/home/AIS/.storage/lovelace" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/lovelace

echo "-----------------------------";
echo "Upgrade pip------------------";
echo "-----------------------------";
pip install pip -U;

echo "-----------------------------";
echo "Install ais-dom--------------";
echo "-----------------------------";
curl -o "/sdcard/ais-dom-0.87.1.tar.gz" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/ais-dom-0.87.1.tar.gz;
pip install /sdcard/ais-dom-0.87.1.tar.gz -U;

echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
