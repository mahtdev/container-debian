FROM debian:12.6-slim

RUN mkdir -p /app
WORKDIR /app

RUN apt update -y \
    && apt upgrade -y \
    && apt-get install --no-install-recommends -y \
    ca-certificates \
    apt-transport-https \
    lsb-release \
    wget \
    curl \
    telnet \
    nano \
    iproute2 \
    procps \
    net-tools \
    build-essential \
    unzip \
    libaio1

COPY . .

RUN chmod +x bin/*
RUN bash ./bin/install_oracle_client.sh
RUN bash ./bin/install_java.sh
RUN sleep 3
RUN rm ./bin/install_oracle_client.sh
RUN rm ./bin/install_java.sh


RUN groupadd -g 1248 ksgroup \
    && useradd -u 1248 -g ksgroup --shell /bin/bash -m ksadmin \
    && mkdir -p /home/ksadmin/redis/data /home/ksadmin/redis/logs \
    && chown -R ksadmin:ksgroup /app \
    && chown -R ksadmin:ksgroup /home/ksadmin/redis

USER ksadmin:ksgroup

ENTRYPOINT ["/app/bin/start.sh"]
