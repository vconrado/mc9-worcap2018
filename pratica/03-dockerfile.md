# Automatizando a criação de uma imagem com Dockerfile

![Dockerfile](../imgs/dockerfile.png "Dockerfile")

**Objetivo**:  
- criar um Dockerfile  
- construir uma imagem a partir do Dockerfile  
- enviar imagem para o [Docker Hub](https://hub.docker.com/). 

## 1. Estrutura Básica

```bash
FROM ubuntu:16.04
LABEL maintainer="Vitor Gomes <vconrado@gmail.com>"

RUN apt-get update \
    && apt-get install -y nginx

COPY html/index.nginx-debian.html /var/www/html/

CMD ["bash"]
```

### 1.1 Gerando a imagem 
```bash
cd mc9-worcap2018/pratica/Dockerfiles/nginx
```

```bash
docker build --tag nginx:1.1 .
```

### 1.2 Executando um container com imagem criada
```bash
docker run -it --name nginx5 nginx:1.1
```


## 2. Dockerfile servidor PostgreSQL

```bash
FROM ubuntu:16.04
LABEL maintainer="Vitor Gomes <vconrado@gmail.com>"

EXPOSE 80

COPY data/entrypoint.sh /entrypoint.sh

RUN apt-get update \
    && apt-get install -y nginx

ENTRYPOINT  /entrypoint.sh
```




## Próximos passos

Acesse [aqui](02-nginx.md) a próxima atividade.
