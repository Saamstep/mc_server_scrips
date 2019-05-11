#!/bin/sh
# ./restart.sh

## Temp/Dev Variables
 ENDPOINT=
 PORT=
 RCON_DIR=
 RCON_PASS=
 URL=https://ptb.discordapp.com/api/webhooks/575831709086646293/D7ILlZc9MAmCoezcEEG0CX05Cr4Cby0mASthw-JS3dJuP94b2ab5mv79DXxDvPoa9T0g
##Panel Controller Vars
  SERVER_ID=
  CLIENT_ID=
  SECRET=
  TOKEN=$(curl -d "client_id=$CLIENT_ID&client_secret=$SECRET" -X POST http://$ENDPOINT/oauth2/token/request?grant_type=client_credentials | jq -r .access_token)

## Init/Functions
echo "Panel Control by Samstep."

echo "Running Restart Script..."

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


broadcast "The server will restart in 1 minute!"
sleep 30
broadcast "The server will restart in 30 seconds"
sleep 25
broadcast "The server will restart in 5 seconds"
sleep 1
broadcast "The server will restart in 4 seconds"
sleep 1
broadcast "The server will restart in 3 seconds"
sleep 1
broadcast "The server will restart in 2 seconds"
sleep 1
broadcast "The server will restart in 1 seconds"
sleep 1
rcon kick @a [Server] Auto-Restarting
curl -X GET 'Content-type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${TOKEN}" http://$ENDPOINT/daemon/server/$SERVER_ID/stop
sleep 5
curl -X GET 'Content-type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${TOKEN}" http://$ENDPOINT/daemon/server/$SERVER_ID/start
discord Server starting...



#End script
exit



