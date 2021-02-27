FROM        ubuntu:20.04

RUN         apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -qq install software-properties-common wget 

RUN         useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
