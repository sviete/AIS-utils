#!/data/data/pl.sviete.dom/files/usr/bin/bash
#
#   AIS
#
#   Homepage: https://ai-speaker.com
#
################################################
#  Add Ubuntu script
#  run it by executiong in AIS dom console:
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/linux/ubuntu.sh | bash
#
################################################
folder=ubuntu-fs
if [ -d "$folder" ]; then
	first=1
	echo "skipping downloading"
fi
tarball="ubuntu.tar.gz"
if [ "$first" != 1 ];then
	if [ ! -f $tarball ]; then
		echo "downloading ubuntu-image"
		curl -o $tarball "https://partner-images.canonical.com/core/disco/current/ubuntu-disco-core-cloudimg-armhf-root.tar.gz"
	fi
	cur=`pwd`
	mkdir -p "$folder"
	cd "$folder"
	echo "decompressing ubuntu image"
	proot --link2symlink tar -xf ${cur}/${tarball} --exclude='dev'||:
	echo "fixing nameserver, otherwise it can't connect to the internet"
	echo "nameserver 1.1.1.1" > etc/resolv.conf
	cd "$cur"
fi
mkdir -p binds
bin=start-ubuntu.sh
echo "writing launch script"
cat > $bin <<- EOM
#!/bin/bash
cd \$(dirname \$0)
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r $folder"
if [ -n "\$(ls -A binds)" ]; then
    for f in binds/* ;do
      . \$f
    done
fi
command+=" -b /dev"
command+=" -b /proc"
## uncomment the following line to have access to the home directory of termux
#command+=" -b /data/data/pl.sviete.dom/files/home:/root"
## uncomment the following line to mount /sdcard directly to /
#command+=" -b /sdcard"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=\$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="\$@"
if [ -z "\$1" ];then
    exec \$command
else
    \$command -c "\$com"
fi
EOM

echo "fixing shebang of $bin"
termux-fix-shebang $bin
echo "making $bin executable"
chmod +x $bin
echo $(date '+%Y %b %d %H:%M') AI-Speaker all done!
echo "You can now launch Ubuntu with the ./${bin} script"
