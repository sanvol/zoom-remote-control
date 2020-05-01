#!/bin/bash
trap cleanUp INT
 
function cleanUp() {
        echo "** CTRL-C pressed, cleaning up..."
        kill $(ps -L u n | grep http.server | awk '{ print $2 }') &> /dev/null
}

python3 -m http.server 8888 &> /dev/null &
nc -lvp 4444
