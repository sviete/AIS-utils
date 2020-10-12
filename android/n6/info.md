
keylayout -> /system/usr/keylayout
vendor_kl -> /vendor/usr/keylayout


mount -o rw,remount,rw /vendor
cp /sdcard/Vendor_0c45_Product_5102.kl /vendor/usr/keylayout/Vendor_0c45_Product_5102.kl
cp /sdcard/Generic.kl /vendor/usr/keylayout/Generic.kl
