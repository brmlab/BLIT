#!/bin/bash -x

PIDFILE="/run/wifi-probe-scanner.pid"
WIFI_INTERFACE="wlxra"
#WIFI_INTERFACE="wlanRabbit"
NOW="$(date +%Y-%m-%d--%H:%M:%S)"
HOOVER_OPTS="--verbose"
MY_PID="$$"
DISPLAY=:0
export DISPLAY
HOME=/home/ruza/

# this is your first wifi device used to connect to Internet. We are detecting your location based on SSID you are connected to on yout first wifi device.
UPLINK_WLAN="${UPLINK_WLAN:-wlp3s0}"
WLAN0_SSID="$(iw dev ${UPLINK_WLAN} info | awk -F' ' '/ssid/ {print $2 }')"

DUMPFILE="/home/LEAKS/wifi/probes/dump-${NOW}-${WLAN0_SSID}.txt"
DUMPFILE_LAST="/home/LEAKS/wifi/probes/dump-last.log"

ln -sf ${DUMPFILE} ${DUMPFILE_LAST}

function find_dbus_session {
        dbus_session_file=/home/ruza/.dbus/session-bus/$(cat /var/lib/dbus/machine-id)-0
        . "$dbus_session_file"
        export DBUS_SESSION_BUS_ADDRESS DBUS_SESSION_BUS_PID

        #echo "DBUS-FCE: D-Bus session is: $DBUS_SESSION_BUS_ADDRESS" >> /tmp/wifi-probes.debug
}

function airmon_stop {
	MON_IFACES="$(ifconfig -a|grep $(ifconfig -a|grep ${WIFI_INTERFACE}|awk '{print $5}'|sed -n 's/:/-/g;1p'|tr a-z A-Z)|awk '{print $1}')" 
	for mon in ${MON_IFACES};do
		echo "## Shutting down $mon"
	        sudo airmon-ng stop ${mon} && echo "** Monitoring device ${mon} destroyed"
	done
}

trap ctrl_c INT
function ctrl_c() {
        echo "** Trapped [CTRL-C]"
        airmon_stop
        echo "** ${DUMPFILE} occasionally written"
}

function main_start {
	find_dbus_session        
	echo "${MY_PID}" > ${PIDFILE}
        
        sudo ifconfig ${WIFI_INTERFACE} up
        sudo airmon-ng start ${WIFI_INTERFACE} && echo "** Monitoring device for ${WIFI_INTERFACE} started"
        
        touch  ${DUMPFILE} && echo "** dumpfile is ${DUMPFILE}"
        
        while read -r LINE; do
                if [[ $LINE == *probe* ]] ; then
			find_dbus_session
			#echo "$(echo \"${LINE}\"|sed 's/.*++//')" >> /tmp/wifi-probes.debug
			su ruza -c "notify-send \"$LINE\""
			#/usr/bin/notify-send -u low "${LINE}"
			#DBUS_SESSION_BUS_ADDRESS="${DBUS_SESSION_BUS_ADDRESS}" DISPLAY=:0 /usr/bin/notify-send -u low "${LINE}"
               fi
        done < <(sudo /usr/local/bin/hoover.pl --interface mon0 --dumpfile ${DUMPFILE} ${HOOVER_OPTS})
}

function main_stop {
       #kill -INT $MY_PID 
       airmon_stop
       kill $MY_PID 
}

case "$1" in
  start)
	find_dbus_session
	#main_stop
        main_start
        ;;
   stop)
        main_stop
        ;;
      *)
        main_start
        ;;
esac
