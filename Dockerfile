FROM shadowsocks/shadowsocks-libev:v3.3.5

USER root

RUN apk --update add privoxy runit tini

COPY assets root/assets
COPY assets/service /etc/service/

ENTRYPOINT ["tini", "--"]

CMD ["runsvdir", "/etc/service"]

EXPOSE 1080 1081
