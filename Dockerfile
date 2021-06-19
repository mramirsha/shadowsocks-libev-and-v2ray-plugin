FROM shadowsocks/shadowsocks-libev:v3.3.5

ENV V2RAY_PLUGIN_VERSION v1.3.1
ENV HOST        YOUR-DOMAIN
ENV SERVER_ADDR YOUR-SHADOWSOCKS-SERVER-IP
ENV SERVER_PORT YOUR-SHADOWSOCKS-SERVER-PORT
ENV PASSWORD    YOUR-SHADOWSOCKS-PASSWORD
ENV METHOD      chacha20-ietf-poly1305 (change it)
ENV OBFS_PLUGIN v2ray-plugin
ENV OBFS_OPTS   host=yourdomain.com;tls;path=/v2ray;certRaw=-----BEGIN PRIVATE KEY-----YOUR CERTIFICATE-----END PRIVATE KEY-----
#ENV ARGS=

USER root

RUN set -ex \
      && apk add --no-cache --virtual .build-deps tar \
      && wget -cq -O /root/v2ray-plugin.tar.gz https://github.com/shadowsocks/v2ray-plugin/releases/download/${V2RAY_PLUGIN_VERSION}/v2ray-plugin-linux-amd64-${V2RAY_PLUGIN_VERSION}.tar.gz \
      && tar xvzf /root/v2ray-plugin.tar.gz -C /root \
      && mv /root/v2ray-plugin_linux_amd64 /usr/local/bin/v2ray-plugin \
      && rm -f /root/v2ray-plugin.tar.gz \
      && apk del .build-deps

USER nobody

CMD exec ss-local \
      -s $SERVER_ADDR \
      -p $SERVER_PORT \
      -k $PASSWORD \
      -m $METHOD \
      -b 0.0.0.0\ # bind address
      -l 1080\ # bind port
      -t 60\
      --fast-open \
      --plugin $OBFS_PLUGIN \
      --plugin-opts $OBFS_OPTS \
#      $ARGS

EXPOSE 1080
