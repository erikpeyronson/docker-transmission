FROM ubuntu:groovy

# Install packages
RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:transmissionbt/ppa \
    && apt-get update \
    && apt-get install -y transmission-cli transmission-common transmission-daemon

# Copy transmission configuration files
COPY settings.json /etc/transmission-daemon/settings.json
RUN chmod 755 /etc/transmission-daemon/settings.json

COPY start.sh /usr/bin/start.sh
ENTRYPOINT /usr/bin/start.sh

