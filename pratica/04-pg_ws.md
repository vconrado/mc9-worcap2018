# Múltiplos containers

![Containers](../imgs/containers.jpg "Containers")

**Objetivos**:  
    - configurar dois containers  
    - exemplo de script de inicialização  
    - um container conectar-se ao outro  
    - mais comandos  

**Resumo**:  
Serão criados dois containers:  
    - PostgreSQL (pg);  
    - Serviço Web em Python (ws).  

# 1. Limpando o ambiente

Liste os containers registrados:

```bash
docker ps -a
```

Remova os containers registrados:

```bash
docker rm nome-do-container
```

# 2. Dockerfiles

Nessa prática serão executados dois containers:  
    - PostgreSQL com registros de minicursos;  
    - WebService para requisição de minicursos.  

    
## 2.1 PostgreSQL 

> Arquivo: pratica/Dockerfiles/pg_ws/postgresql/Dockerfile

Esse é o Dockerfile que será usado para a construção do container com o banco de dados:
```bash
FROM ubuntu:16.04
LABEL maintainer="Vitor Gomes <vconrado@gmail.com>"

EXPOSE 5432

ENV PG_PASSWORD=dbpass
ENV PGDATA=/var/lib/postgresql/data

VOLUME /var/lib/postgresql/data

RUN apt-get update \
    && apt-get install -y sudo postgresql-9.5 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p $PGDATA \
    && chown -R postgres:postgres $PGDATA \
    && chmod o-rxw $PGDATA \
    && echo "export PGDATA=$PGDATA" >> /etc/bash.bashrc \
    && echo "data_directory = '$PGDATA'" >> /etc/postgresql/9.5/main/postgresql.conf \
    && mkdir -p /data


COPY files/entrypoint.sh /entrypoint.sh

COPY files/create_table.sql /data
COPY files/insert_data.sql /data

RUN chown -R postgres:postgres /data

ENTRYPOINT  ["/entrypoint.sh"]
```

> Ver entrypoint.sh

### 2.1.1 Construindo
Para construir nosso container de banco de dados:  
> Pasta: pratica/Dockerfiles/pg_ws/postgresql  
```bash
docker build --tag pg:2.0 .
``` 

## 2.2 Webservice
A imagem do container do Webservice será construída da seguinte forma:  

> Arquivo: pratica/Dockerfiles/pg_ws/webservice/Dockerfile

```bash
FROM python:3.6
LABEL maintainer="Vitor Gomes <vconrado@gmail.com>"

EXPOSE 5000

RUN pip3 install flask psycopg2 psycopg2-binary

RUN mkdir /data
COPY files/rest.py /data

CMD  ["python", "/data/rest.py"]
```


### 2.2.1 Construindo a imagem do WebService

Para construir nosso container de webservice:  
> Pasta: pratica/Dockerfiles/pg_ws/webservice  
```bash
docker build --tag ws:1.0 .
```

> Ver entrypoint.sh
 
## 3. Executando

Executando o banco de dados:

```bash
docker run -it --name pg pg:2.0
```

Verifique se os dados foram carregados corretamente:

```bash
sudo -u postgres psql -U postgres -c "SELECT * FROM minicursos;"
```

Em outro terminal, execute o webservice:
```bash
docker run -it --name ws ws:1.0
```

## 4. Testando

Abra no browser o IP do container ws: [http://172.17.0.3:5000](http://172.17.0.3:5000).

> Descubra o IP do container usando **docker inspect ws** 

## 5. Conectando os containers em uma rede
Criando uma rede:
```bash
docker network create pg_ws_net
```

Conectando o container **pg** à rede criada:
```bash
docker network connect pg_ws_net pg
```

Conectando o container **ws** à rede criada:
```bash
docker network connect pg_ws_net ws
```

> Acesse novamente o link do webservice


## 5. Próximos passos

Acesse [aqui](05-compose.md) a próxima atividade.
