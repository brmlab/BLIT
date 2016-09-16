# Notes
since I dont have an working GPS in my laptop and want to have some information where SSIDs were seen at the same time I've solved that by grabing an SSID of my primary wireless device I am connected to to be included in the filename. Thus by having an SSID of my home network in the filename of the log i know the SSID was seen when i was at home, etc.

# Instalation
* install notify-send binary and airmon-ng
apt-get install libnotify-bin aircrack-ng tshark

cp hoover.pl /usr/local/bin/;
chmod 755 /usr/local/bin/hoover.pl

cp hoover-start.sh /usr/local/bin/;
chmod 755 /usr/local/bin/hoover-start.sh
* change WIFI_INTERFACE to your WiFi sniffing interface and
* UPLINK_WLAN to Wifi interface you are using to connect to Internet 
editor /usr/local/bin/hoover-start.sh 

cp dbus-find-session.sh /usr/local/bin/;
chmod 755 /usr/local/bin/dbus-find-session.sh

cp wifi-probes.service /etc/systemd/system/
* change value of User=ruza to user to be notified
editor /etc/systemd/system/wifi-probes.service;
systemctl daemon-reload

cp sudoers /etc/sudoers.d/wifi-probes

mkdir /home/LEAKS/wifi/probes/

systemctl start wifi-probes.service;
systemctl status wifi-probes.service

* watch log files in /home/LEAKS/wifi/probes/ directory. You should also get desktop notification from time to time
