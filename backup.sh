#!/bin/sh
# ./backup.sh

## Temp/Dev Variables
 ENDPOINT=''
 PORT=''
 RCON_DIR=''
 RCON_PASS=
 URL=
##Panel Controller Vars
  SERVER_ID=
  CLIENT_ID=
  SECRET=
  TOKEN=$(curl -d "client_id=$CLIENT_ID&client_secret=$SECRET" -X POST http://$ENDPOINT/oauth2/token/request?grant_type=client_credentials | jq -r .access_token)
##Backup Vars
  d=$(date +%Y-%m-%d)
  NAME=world_$d
  SERVER_PATH=""
  BACKUP_PATH=""
  VANILLA= #true or false

## Init/Functions
echo "Panel Control by Samstep."

echo "Running $0"

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

##Shut down server
broadcast "Server will be backing up in 1 minute"
sleep 50
broadcast "10 Seconds till backup..."
sleep 5
rcon kick @a [Console] Automatic Backup Occuring...
rcon save-all
sleep 2
curl -X GET 'Content-type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${TOKEN}" http://$ENDPOINT/daemon/server/$SERVER_ID/stop
discord An automatic backup is taking place... This could take anytime between 2-5 minutes.

sleep 1
echo starting...
if [ $VANILLA = 'true' ] 
then
echo Using Vanilla mode...
echo Zipping...
zip -r $BACKUP_PATH/$NAME $SERVER_PATH/world
else
echo Using Bukkit/Spigot mode...
mkdir $BACKUP_PATH/$NAME
zip -r $BACKUP_PATH/$NAME/world $SERVER_PATH/world
zip -r $BACKUP_PATH/$NAME/world_nether $SERVER_PATH/world_nether
zip -r $BACKUP_PATH/$NAME/world_the_end $SERVER_PATH/world_the_end
fi

curl -X GET 'Content-type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${TOKEN}" http://$ENDPOINT/daemon/server/$SERVER_ID/start



#End script
exit



