# Instalation
cp notify-arp-neighbours.sh /usr/local/sbin/;
chmod 755 /usr/local/sbin/notify-arp-neighbours.sh

cp netiface-default.py /usr/local/bin/;
chmod 755 /usr/local/bin/netiface-default.py

# Install Python netifaces , this command may be different for you
pip install netifaces
cp notify-send-as-root-MSG-permanent.sh /usr/local/bin/;
chmod 755 /usr/local/bin/notify-send-as-root-MSG-permanent.sh

* change value of NOTIFY_USER variable to username of the user to send notification to
editor /usr/local/bin/notify-send-as-root-MSG-permanent.sh

cp dbus-find-session.sh /usr/local/bin/;
chmod 755 /usr/local/bin/dbus-find-session.sh

* install arp-scan
apt-get install arp-scan

cp arp-localnet.sh /usr/local/bin/;
chmod 755 /usr/local/bin/arp-localnet.sh

# Edit value of LOGFILE, if you want to keep logs
editor /usr/local/bin/arp-localnet.sh

cp notify-arp-neighbours /etc/network/if-up.d/

* reconnect your network and you should receive and notification about your network neighbours
