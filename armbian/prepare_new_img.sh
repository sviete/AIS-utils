# Create image from USB / SDCARD

1. Preconfigure HA from app
add: mqtt, ssh, file

2. Remove HA account and some settings

cd /usr/share/hassio/homeassistant/.storage
rm onboarding person auth auth_provider.homeassistant http.auth mobile_app frontend.user_data_*

3. Twick the armbian settings
change hostname for avachi to ais-dom
/etc/hostname

change motd baner to ais-dev3 or asi-pro1
nano /etc/armbian-release

forget all wireless connections

4. To resize SD card on the next Armbian run
echo "yes" > /root/.no_rootfs_resize
deluser --remove-all-files ais
touch /root/.not_logged_in_yet

in /etc/custom_service/start_service.sh add:
# Maximize root partition size
todo_rootfs_resize="/root/.no_rootfs_resize"
[[ -f "${todo_rootfs_resize}" && "$(cat ${todo_rootfs_resize} 2>/dev/null | xargs)" == "yes" ]] && {
    armbian-tf 2>/dev/null &&
    echo "[$(date +"%Y.%m.%d.%H:%M:%S")] Maximize root partition done!" >>${custom_log}
}

poweroff

5. Use Gparted to shrink the partition.
check the disk end sector in info or via fdisk

6. Check disk end sector via fdisk

sudo fdisk -l -u=sectors /dev/mmcblk0

```
Disk /dev/mmcblk0: 59,45 GiB, 63831015424 bytes, 124669952 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x8588a40a

Device         Boot  Start      End  Sectors  Size Id Type
/dev/mmcblk0p1        8192   530431   522240  255M  c W95 FAT32 (LBA)
/dev/mmcblk0p2      532480 13004799 12472320  5,9G 83 Linux
```

7.use dd to copy the disk

sudo dd if=/dev/mmcblk0 of=./5.img bs=SECTOR_SIZE count=END_SECTOR+1 status=progress

for example:
sudo dd if=/dev/mmcblk0 bs=512 count=13004800 status=progress \
 | gzip -c > ais_dev3_lunar_6.1.46_server_2023.08.25.img.gz

8. Publish image in mega
https://mega.nz/folder/ncIWAISS#_fJBggsNUnw-DMKDV7ZseQ

9. Download and write via balena-etcher

10. Run on box

adb reboot bootloader
