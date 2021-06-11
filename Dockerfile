ARG j_version=15
FROM adoptopenjdk/openjdk${j_version}:alpine
ARG mc_version=1.16.5
RUN apk add --no-cache bash wget && \
    mkdir -p /opt/minecraft /data/plugins && \
    wget -q "https://cdn.getbukkit.org/spigot/spigot-${mc_version}.jar" -O /opt/minecraft/spigot.jar
EXPOSE 25565
EXPOSE 25575
ENV MEM_MAX=4g
ENV MEM_INITIAL=2g
WORKDIR /data
ADD . /
ENTRYPOINT [ "/opt/minecraft/entrypoint.sh" ]
