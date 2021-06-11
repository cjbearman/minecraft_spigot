#!/bin/bash

# The first thing we are going to do is manage our plugins
# Get rid of any current plugin references
rm -f /data/plugins/*.jar

if [ -z "$DEACTIVATE_PLUGINS" ]; then
	echo "Installing plugins"
	echo "------------------"
	for i in $(find /plugins/curated -name '*.jar'); do
		plugin=$(basename $i)
		from="/plugins/curated/${plugin}"
		to="/data/plugins/${plugin}"
		echo "Link ${from} => ${to}"
		ln -s $from $to
	done
	for i in $(find /plugins/custom -name '*.jar'); do
		plugin=$(basename $i)
		from="/plugins/custom/${plugin}"
		to="/data/plugins/${plugin}"
		echo "Link ${from} => ${to}"
		rm -f $to
		ln -s $from $to
	done
else
	echo "Not installing plugins due to DEACTIVATE_PLUGINS being set"
fi

cd /data
/opt/minecraft/genprops.sh
exec java -Xmx${MEM_MAX} -Xms${MEM_INITIAL} -jar /opt/minecraft/spigot.jar
