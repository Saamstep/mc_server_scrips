## Server scripts
*Tested on MacOS Mojave 10.14.2*
### All scripts that use the rcon() function.

- Requires permission. Use chmod or equivalent. 

- Requires [rcon-cli](https://github.com/itzg/rcon-cli)

### restart.sh and start.sh requires [jq](https://stedolan.github.io/jq/)

### Vars

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
  
 
 ### Usage of the message.sh script.
 
 You may start adding code under the comment that says **Script starts here**
 
 ```
 discord "Message" # Discord message via webhook url
 
 rcon Command # Just MC command (notice no quotes)
 
 broadcast "Message" # Discord & MC
 ```
 
