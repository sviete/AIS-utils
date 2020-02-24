# rclone mount
su -mm -c "export PATH=$PATH:/data/data/pl.sviete.dom/files/usr/bin/; rclone mount mega:/ /data/data/pl.sviete.dom/files/home/dom/dyski-zewnętrzne/cloud --allow-other --uid 10062 --gid 10062 --config /data/data/pl.sviete.dom/files/home/AIS/.dom/rclone.conf"

su -mm -c "export PATH=$PATH:/data/data/pl.sviete.dom/files/usr/bin/; rclone mount drive:/ /data/data/pl.sviete.dom/files/home/dom/dyski-zewnętrzne/drive --allow-other --uid 10062 --gid 10062 --config /data/data/pl.sviete.dom/files/home/AIS/.dom/rclone.conf"

su -mm -c "export PATH=$PATH:/data/data/pl.sviete.dom/files/usr/bin/; rclone mount drive:/ /data/data/pl.sviete.dom/files/home/drive --allow-other --uid 10062 --gid 10062 --config /data/data/pl.sviete.dom/files/home/AIS/.dom/rclone.conf"

# check what is mounted
mount | tail -n1

# unmount
fusermount -u /data/data/pl.sviete.dom/files/home/dom/1
