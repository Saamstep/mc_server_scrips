## Build tools, craftbukkit/spigot jar builder. Requires java! 

echo "Build Tools"

sleep 1


echo "https://www.spigotmc.org/wiki/buildtools/#versions"
echo "Choose version: (latest for latest version)".

read version
java -jar BuildTools.jar --rev $version


exit

