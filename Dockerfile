FROM        ubuntu:20.04

RUN         apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -qq install software-properties-common wget libc6-dev libunwind8 gnupg
RUN         add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN         apt update && sudo apt install libstdc++6

RUN         wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && dpkg -i packages-microsoft-prod.deb

RUN         apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN         echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list
RUN         apt-get -qq update && apt-get -qq install mono-complete

RUN         useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
