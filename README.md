# BLIT
## Brmlab Linux Improvements Toolkit

  * is an collection of tools and scripts you can implement yourself on your Linux desktop/notebook to improve an experience using your device.
  * consists of tools related to security, information gathering, anonymity and so on.
  * toolkit is provided as-is and installing any tool from this toolkit in your Linux could require non-trivial tasks and adjustments or even need to read/rewrite/customize some parts of the code.
  * some of the scripts included are not my own but were taken from various sources from the Internet (if they were better comparing to what i wrote by myself). Mostly I respect their authorship by not touching headers with a link to the original autor if the files contain such information. However the files links to the original author, files can be subject to my changes, customizations or improvements to my needs.
 
### Feel free to add your improvements/scripts to this collection

## Tools included in toolkit in more detail:
  
* **MaDHCPhost changer** - you probably know macchanger that changes hardware address of your network device when you want to avoid tracking identities bundled with your network device identificator (MAC address). Unfortunately this is not the only identificator bundled with your device. Normally you are sending your hostname in your DHCP request for an IPv4 address. This script selects new DHCP hostname from dictionary of common words and fake your hostnam in DHCP request. Your real local hostname is not changed in any way. Warning: can eat up all your DHCP range of not assigned IP address if you reconnecting frequently
* **My UDEV notify** - udev rule scripts that notifies you each time an device is plugged/unplugged.
* **NeNe discovery** - discovers network devices connected to the same network as your laptop. When you connect with your laptop via ethernet/WiFi to the network you'd possibly like to know something about network devices that resides on the same network as You. This script does it automatically each time you connect and makes an desktop notification with a list of devices discovered.
* **thinkpad-antitheft** - customized script that starts when you lock screen, ends itself when screen unlocked and activate an audio alarm when device moves while screen locked. Needs an working HDAPS (Thinkpad notebooks)
* **wifi-probes**: collection of scripts that sniffs wireless network broadcasts from wireless devices around, logs them and notify you an SSIDs seen. Requires an secondary wireless device.
