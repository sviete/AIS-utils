# exclude exec when login with ssh
if [ "x${SSH_CLIENT}" = "x" ]; then
 # this will be done only on first run
 chmod 777 /data/data/pl.sviete.dom/.ais/*
 /data/data/pl.sviete.dom/.ais/bootstrap_ais.sh
 # run pm2
 pm2 flush;
 pm2 resurrect;
 rm /data/data/pl.sviete.dom/files/home/.pm2/logs/*
fi

# run sshd
if ! pgrep "sshd" >/dev/null ; then echo "[Starting sshd...]" && sshd && echo "[OK]"; else echo "[Połaczenie SSH]"; fi

# set alias
alias ll="ls -l"

# start activity
if [ "x${SSH_CLIENT}" = "x" ]; then
  am start -n pl.sviete.dom/pl.sviete.dom.WelcomeActivity --es BROADCAST_REDIRECT_ME_TO_ACTIVITY 1

  # we  are able to call iptables only as root
  if ! su -c "/system/bin/iptables -L PREROUTING -t nat -n |grep -q 8022"; then
    echo "Service SSH on port 22 and 8022"
    su -c "/system/bin/iptables -t nat -A PREROUTING -p tcp --dport 22 -j REDIRECT --to-port 8022"
  fi

  if ! su -c "/system/bin/iptables -L PREROUTING -t nat -n |grep -q 8180"; then
    echo "Service HTTP on port 80 and 8180"
    su -c "/system/bin/iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8180"
  fi

  if ! su -c "/system/bin/iptables -L PREROUTING -t nat -n |grep -q 1024"; then
    echo "Service FTP on port 21 and 1024"
    su -c "/system/bin/iptables -t nat -A PREROUTING -p tcp --dport 21 -j REDIRECT --to-port 1024"
  fi

  #
  su -c "mount -o rw,remount,rw /";
  su -c "echo  ' ' >> /ueventd.rc";
  su -c "echo  '# AIS devices' >> /ueventd.rc";
  su -c "echo  '/dev/ttyACM0                 0777   root       root' >> /ueventd.rc";
  # restart ueventd service
  su -c "pkill ueventd";
  su -c "chmod 777 /dev/ttyACM0";
  su -c "mount -o ro,remount,r0 /";
fi

# install ais dom if not installed
if [ "x${SSH_CLIENT}" = "x" ]; then
  if [ ! -f /data/data/pl.sviete.dom/files/usr/bin/hass ]; then
    echo "AIS dom not found! installing...";
    curl --header "Content-Type: application/json" --max-time 2 --request POST --data '{"text":"Coś poszło nie tak. Przywracam system, poczekaj."}' http://localhost:8122/text_to_speech;
    pip install --upgrade --force-reinstall ais-dom;
  fi
fi
