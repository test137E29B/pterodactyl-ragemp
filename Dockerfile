FROM        ubuntu:20.04

RUN         apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -qq install software-properties-common wget

RUN         wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
            && dpkg -i packages-microsoft-prod.deb


RUN         useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
