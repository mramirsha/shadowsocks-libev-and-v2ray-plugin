FROM shadowsocks/shadowsocks-libev:v3.3.5

USER root

CMD ["ss-local", "-c", "/root/assets/config.json"]

EXPOSE 1080
