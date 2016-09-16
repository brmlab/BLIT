# Instalation
* install dictionary

apt-get install wamerican

cp hostnamechanger /etc/network/if-pre-up.d/;
chmod 755 /etc/network/if-pre-up.d/hostnamechanger

watch 'egrep "^send host-name" /etc/dhcp/dhclient.conf'
* disconnect and connect back to your network 
