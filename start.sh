#!/bin/sh
# ./start.sh

## Temp/Dev Variables
 ENDPOINT=
 PORT=
 RCON_DIR=
 RCON_PASS=
 URL=
##Panel Controller Vars
 SERVER_ID=
 CLIENT_ID=
 SECRET=
 TOKEN=$(curl -d "client_id=$CLIENT_ID&client_secret=$SECRET" -X POST http://$ENDPOINT/oauth2/token/request?grant_type=client_credentials | jq -r .access_token)
## Init/Functions
echo "Panel Control by Samstep."

echo "Running $0..."

##RCON as function
rcon() {
  cd $RCON_DIR
  ./rcon-cli --host $ENDPOINT --port $PORT --password $RCON_PASS "$*"
    echo "Ran command $*"
}

discord() {
  curl -X POST -d "{\"username\": \"Server\", \"avatar_url\": \"https://image.flaticon.com/icons/png/512/226/226777.png\", \"content\": \"$*\"}" ${URL}
  echo "Curl sucessful"
}

broadcast() {
  curl -X POST -d "{\"username\": \"Server\", \"avatar_url\": \"https://image.flaticon.com/icons/png/512/226/226777.png\", \"content\": \"$*\"}" ${URL}
  echo "Curl sucessful"
  cd $RCON_DIR
  ./rcon-cli --host $ENDPOINT --port $PORT --password $RCON_PASS "tellraw @a [\"[Broadcast] $*\"]"
    echo "Broadcasted -> $*"
}

discord "Server starting..."
sleep 1
curl -X GET 'Content-type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${TOKEN}" http://$ENDPOINT/daemon/server/$SERVER_ID/start

#End script
exit



