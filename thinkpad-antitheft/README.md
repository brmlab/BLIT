# Instalation

# Configure keyboard shortcut in your WM (i am using an i3wm) to run lockscreen.sh to lock your screen.
# bindsym Control+Mod1+L exec /home/ruza/.i3/scripts/lockscreen.sh

# Copy tp-theft.pl to /usr/local/bin/tp-theft.pl and make it executable.
cp tp-theft.pl /usr/local/bin/tp-theft.pl
chmod 755 /usr/local/bin/tp-theft.pl

# Copy sudoers file to /etc/sudoers.d/tp-theft
cp sudoers /etc/sudoers.d/tp-theft
