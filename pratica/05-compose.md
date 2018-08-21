# Gerenciando múltiplos containers com compose

![Compose](../imgs/compose.png "Compose")

## 1. O que é

## 2. O arquivo docker-compose.yaml

```bash
version: '2'

networks:
    pg_ws_network:

services:
    pg:
        image: "pg:2.0"
        stdin_open: true
        tty: true
        networks:
            - pg_ws_network
    ws:
        image: "ws:1.0"
        networks:
            - pg_ws_network
```


### 3. Gerenciando os serviços

Subindo os serviços:
```bash
docker-compose up
```

Encerrando os serviços:
```bash
docker-compose down
```


## 4. Próximos passos

Acesse [aqui](06-portainer.md) a próxima atividade.
