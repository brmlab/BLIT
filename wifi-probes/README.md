# Instalation
* install notify-send binary and airmon-ng
apt-get install libnotify-bin aircrack-ng tshark

cp hoover.pl /usr/local/bin/
chmod 755 /usr/local/bin/hoover.pl

cp hoover-start.sh /usr/local/bin/
chmod 755 /usr/local/bin/hoover-start.sh
* change WIFI_INTERFACE to your WiFi sniffing interface and
* UPLINK_WLAN to Wifi interface you are using to connect to Internet 
editor /usr/local/bin/hoover-start.sh 

cp wifi-probes.service /etc/systemd/system/
* change value of User=ruza to user to be notified
editor /etc/systemd/system/wifi-probes.service
systemctl daemon-reload

cp sudoers /etc/sudoers.d/wifi-probes

mkdir /home/LEAKS/wifi/probes/

systemctl start wifi-probes.service
systemctl status wifi-probes.service

* watch log files in /home/LEAKS/wifi/probes/ directory. You should also get desktop notification from time to time
