# Dockerfile for ShadowsocksR

FROM alpine:3.8

LABEL maintainer="Ghostry <ghostry.green@gmail.com>"

RUN apk update \
    && apk add --update python libsodium unzip wget \
    && rm -rf /var/cache/apk/*

# install slc
RUN mkdir /slc \
    && cd /slc \
    && wget --no-check-certificate https://github.com/shadowsocksrr/shadowsocksr/archive/3.2.2.zip -O /tmp/slc.zip \
    && unzip -d /tmp /tmp/slc.zip \
    && mv /tmp/shadowsocksr-3.2.2/shadowsocks /slc/shadowsocks \
    && apk del unzip wget \
    && rm -rf /slc/shadowsocks/*.sh \
    && rm -rf /tmp/*

# slc default configuration
COPY shadowsocks.json /slc/default.json

# slc script
RUN cd /slc/ \
  # start.sh
  && echo 'if [ ! -f "/etc/shadowsocks/local.json" ]; then cp /slc/default.json /etc/shadowsocks/local.json;fi;python /slc/shadowsocks/local.py -c /etc/shadowsocks/local.json' > start.sh \
  && chmod 775 start.sh

ENTRYPOINT ["sh", "/slc/start.sh"]
