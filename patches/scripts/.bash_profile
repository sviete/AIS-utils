# exclude exec when login with ssh
if [ "x${SSH_CLIENT}" = "x" ]; then
 # this will be done only on first run
 chmod 777 /data/data/pl.sviete.dom/.ais/*
 /data/data/pl.sviete.dom/.ais/bootstrap_ais.sh
 # run pm2
 pm2 flush;
 pm2 resurrect;
fi

# run sshd
if ! pgrep "sshd" >/dev/null ; then echo "[Starting sshd...]" && sshd && echo "[OK]"; else echo "[Połaczenie SSH]"; fi


# set alias
alias ll="ls -l"
