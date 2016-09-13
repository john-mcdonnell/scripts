sudo dd if=/dev/zero of=/opt/swapfile bs=51200 count=65536
sudo mkswap /opt/swapfile 
sudo swapon /opt/swapfile
sudo cat /proc/swaps

# Append this line to /etc/fstab in order to re-instate it automatically during server restarts.
#/swapfile               swap                    swap    defaults        0 0
