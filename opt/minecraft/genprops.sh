#!/bin/bash
if [ ! -f /data/server.properties ]; then
cat << EOF > /data/server.properties
enable-jmx-monitoring=false
rcon.port=25575
enable-command-block=false
gamemode=
enable-query=false
os-permission-level=4
generator-settings=
level-name=world
motd=Chris Test Server
query.port=25565
pvp=true
generate-structures=true
difficulty=easy
network-compression-threshold=256
max-tick-time=60000
max-players=20
use-native-transport=true
online-mode=true
enable-status=true
allow-flight=false
broadcast-rcon-to-ops=true
view-distance=10
max-build-height=256
server-ip=
server-port=25565
allow-nether=true
enable-rcon=true
sync-chunk-writes=true
op-permission-level=4
prevent-proxy-connections=false
resource-pack=
entity-broadcast-range-percentage=100
player-idle-timeout=0
rcon.password=changeme
force-gamemode=false
rate-limit=0
debug=false
hardcore=false
white-list=false
broadcast-console-to-ops=true
spawn-npcs=true
spawn-animals=true
snooper-enabled=true
function-permission-level=2
level-type=default
text-filtering-config=
spawn-monsters=true
enforce-whitelist=false
resource-pack-sha1=
spawn-protection=16
max-world-size=29999984
EOF

echo "level-seed=${SEED}" >> /data/server.properties

echo "Created initial server.properties"
fi


