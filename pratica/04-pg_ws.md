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
    






docker network create pg_ws_net

docker network connect pg_ws_net pg


docker network connect pg_ws_net ws


