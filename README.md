# shadowsocks-libev-and-v2ray-plugin
This Dockerfile build an image for shadowsocks-libev with v2ray-plugin, based on Alpine Linux.

# Usage
You can use this image to setup a shadowsocks-libev client on your local machine.
You can use this image to run multi container or on the other words, multi proxy on your server and pass it to your reverse proxy to handle your requests

# setup
Just change the variable on docker file, build it and run the container.

``docker build -t shadowsocks-client .``

``docker run -d -p 1080:1080 --name client-1 shadowsocks-client``

And now you have socks5 proxy.

To test your proxy run the blow command

``curl --socks5-hostname 127.0.0.1:1080 -v https://www.google.com``

# ENV Variable
HOST = your domain

SERVER_ADDR = your shadowsocks server ip address which you wanna connect to that

SERVER_PORT = your shadowsocks server port 

LOCAL_ADDR = your local address whitch you wanna bind to your server address

LOCAL_PORT = your local port whitch you wanna bind it to your server port

PASSWORD = your shadowsocks password

METHOD = your encryption method (rc4-md5,
                                  aes-128-gcm, aes-192-gcm, aes-256-gcm,
                                  aes-128-cfb, aes-192-cfb, aes-256-cfb,
                                  aes-128-ctr, aes-192-ctr, aes-256-ctr,
                                  camellia-128-cfb, camellia-192-cfb,
                                  camellia-256-cfb, bf-cfb,
                                  chacha20-ietf-poly1305,
                                  xchacha20-ietf-poly1305,
                                  salsa20, chacha20 and chacha20-ietf.
                                  The default cipher is aes-256-gcm.
                                )
                                
PLUGIN = you shadowsocks plugin (The default plugin is v2ray-plugin)

PLUGIN_OPTS = your plugin configuration

