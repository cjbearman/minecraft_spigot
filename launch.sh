#!/bin/bash

function rdef {
	read -p "$1 ($2):" ANS
	if [ -z "$ANS" ]; then
		echo $2
	else
		echo $ANS
	fi
}

SERVER_NAME=$(rdef "Server Name" "test")
SERVER_VOL=$(rdef "Volume" "")
SEED=$(rdef "Seed" 12542)
SERVER_PORT=$(rdef "Server Port" 25565)
RCON_PORT=$(rdef "RCON Port" 25575)
RCON_PASSWORD=$(rdef "RCON Password" "changeme")
DYNMAP_PORT=$(rdef "Dynmap Port" 8123)

OPTS=""
if [ -z "$SERVER_VOL" ]; then
	OPTS="${OPTS} "
else
	OPTS="${OPTS} -v ${SERVER_VOL}:/data"
fi

docker run \
	-d \
	--privileged \
	--name ${SERVER_NAME} \
	-p ${SERVER_PORT}:25565 \
	-p ${RCON_PORT}:25575 \
	-e "RCON_PASSWORD=${RCON_PASSWORD}" \
	-p ${DYNMAP_PORT}:8123 \
	-e LEVEL_SEED=${SEED} \
	${OPTS} \
	$* \
	cbearman/minecraft:dev
