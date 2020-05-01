#!/bin/bash
trap cleanUp INT
 
function cleanUp() {
        echo "** CTRL-C pressed, cleaning up..."
        kill $(ps -L u n | grep http.server | awk '{ print $2 }') &> /dev/null
}
export PORT_HTTP=8888
export PORT_NC=4444
export IP=$(ip a | grep 'wlp2s0' | awk '{print $2}' | tail -1)
export IP=${IP//\/*/}

python3 -m http.server $PORT_HTTP &> /dev/null &
echo "HTTP server started on ${IP}:${PORT_HTTP}" 
echo "Netcat waiting for a reverse shell on ${IP}:${PORT_NC}" 
nc -lvp $PORT_NC  
