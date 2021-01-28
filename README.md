You must provide access in you local ~/.ssh directory as this folder will be mounted.

docker-compose.yml example:

Ports must be in range of 3330-3339

```
version: 2

services:
  tunnel:
    image: haraldtollefsen/ssh-tunnel:1.0
    volumes:
      - $HOME/.ssh:/root/ssh:ro
    environment:
      TUNNEL: <remote username>@<hostname to tunnel>
      DESTINATION: <hostname to destination>
      LOCAL_PORT: <local port to use>
      REMOTE_PORT: <remote port to target>
```

Postgres DSN: postgresql://<db_user>:<db_password>@tunnel:<local port to use>/<database name>?serverVersion=13&charset=utf8

Mysql DSN: mysql://<db_user>:<db_password>@tunnel:<local port to use>/<database name>?serverVersion=5.7
