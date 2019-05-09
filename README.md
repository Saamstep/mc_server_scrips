## Server scripts

### script.sh

Requires permission. Use chmod or equivalent. 

Requires rcon-cli
https://github.com/itzg/rcon-cli

### Vars

```
 ENDPOINT= # Include in quote, server IP (no port)
 PORT= # Inclulde in quote, MC RCON port
 RCON_DIR= # Path as String, Rcon directory (rcon-cli folder path)
 RCON_PASS= # No quotes, RCON password for minecraft server
 URL= # No quotes, webhook URL for Discord
 ```
 
 ### Usage
 
 You may start adding code under the comment that says [b]Script starts here[b]
 
 ```
 discord() "Message" # Discord message via webhook url
 
 rcon() Command # Just MC command (notice no quotes)
 
 broadcast "Message" # Discord & MC
 ```
 
