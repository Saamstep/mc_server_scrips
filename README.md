## Server scripts
*Tested on MacOS Mojave 10.14.2*

## Dependencies/Requirements
### All scripts 

- Requires permission. Use chmod or equivalent. 

### message.sh

- Requires [rcon-cli](https://github.com/itzg/rcon-cli)

### restart.sh and start.sh
- Requires [jq](https://stedolan.github.io/jq/)

## Vars

### General
```
 ENDPOINT= # Include in quote, server IP (no port)
 PORT= # Inclulde in quote, MC RCON port
 RCON_DIR= # Path as String, Rcon directory (rcon-cli folder path)
 RCON_PASS= # No quotes, RCON password for minecraft server
 URL= # No quotes, webhook URL for Discord
 ```
 
### Panel Controller Vars
```
  SERVER_ID= # Server ID 
  CLIENT_ID= # Client ID
  SECRET= # Secret generated when remote connection info is provided
  **DO NOT** modify the TOKEN variable.
```
  
 ## How To:
 ### Usage of the message.sh script.
 
 You may start adding code under the comment that says **Script starts here**
 
 ```
 discord "Message" # Discord message via webhook url
 
 rcon Command # Just MC command (notice no quotes)
 
 broadcast "Message" # Discord & MC
 ```
 
 
 ### TODO
- Backup script
- test restart.sh and start.sh on actual server machine
- think of more scripts...
  - join my [Devcord](https://samstep.net/devcord) (Dev-Discord) to suggest a script.
