## PM2 delete existing services
```
pm2 delete webssh
pm2 delete ftp
pm2 delete mqtt
pm2 delete ais
```

## PM2 create services
```
pm2 start ttyd --name webssh --output /dev/null --error /dev/null --restart-delay=150000 -- -p 8888 bash
pm2 start tcpsvd --name ftp --output  /dev/null --error  /dev/null --restart-delay=150000 -- -vE 0.0.0.0 1024 ftpd -w /sdcard
pm2 start mosquitto --name mqtt --output /dev/null --error /dev/null --restart-delay=150000 -- -c /data/data/pl.sviete.dom/files/usr/etc/mosquitto/mosquitto.conf
pm2 start /data/data/pl.sviete.dom/files/usr/bin/hass --name ais --output /dev/null --error /dev/null --restart-delay=150000 --interpreter=/data/data/pl.sviete.dom/files/usr/bin/python -- -c /data/data/pl.sviete.dom/files/home/AIS/
```

## PM2 dynamic services
```
pm2 restart tunnel || pm2 start /data/data/pl.sviete.dom/files/usr/bin/lt --name tunnel --output /dev/null --error /dev/null --restart-delay=150000 -- -h http://paczka.pro -p 8180 -s dom-xxxxxx

```
pm2 restart zigbee || pm2 start /data/data/pl.sviete.dom/files/home/zigbee2mqtt/index.js --name zigbee --output /dev/null --error /dev/null --restart-delay=150000
```
