# shadowsocks-go-docker #
A docker image of [shadowsocks-go](https://github.com/shadowsocks/shadowsocks-go), based on [alpine linux](https://hub.docker.com/_/alpine/)   

Command line options
---

Command line options can override settings from configuration files. Use `-h` option to see all available options.
### required ###
`shadowsocks-local` - client mode
`shadowsocks-server`  - server mode
### optional ###
`-m` - encryption `aes-128-cfb`  
`-s`  - server_address  
`-p` - server_port  
`-k` - server_password  
`-c` - config_path (`/etc/shadowsocks` by default)  
`-b` - local_address  
`-l`  - local_port  
`-d` - debug mode   

Note
---
When shadowsocks-go-docker container starts, it's copy default config (if not exists) to `/etc/shadowsocks`.

Config file contains all parameters (for server and client), but in server mode you **don't** need `server_address` and `local_port`.  

In client mode shadowsocks-go works like socks5 proxy without authentication (which allows you to indicate it in any program)  and redirects all requests to shadowsocks server.
Or you can use [desktop clients](https://shadowsocks.org/en/download/clients.html)

 docker-compose.yml 
---
```
services:
  shadowsocks_server:
    image: sebreiro/shadowsocks-go:latest
    container_name: shadowsocks_server
    restart: unless-stopped
    command: shadowsocks-server
    volumes:
      - /etc/shadowsocks:/etc/shadowsocks
    ports:
      - 8387:8387
      - 8388:8388
```
