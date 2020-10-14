
keylayout -> /system/usr/keylayout
vendor_kl -> /vendor/usr/keylayout


mount -o rw,remount,rw /vendor
cp /sdcard/Generic.kl /vendor/usr/keylayout/Generic.kl
