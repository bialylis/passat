 node backend/index.js &
 p1=$!	
 node frontend/server.js &
p2=$!

trap 'kill "$p1"; kill "$p2"' SIGINT
while kill -s 0 "$p1" || kill -s 0 "$p2"; do
    wait "$p1"; wait "$p2"
done &>/dev/null
