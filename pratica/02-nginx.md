# Preparando um container com NGINX

![NGINX](../imgs/nginx.jpg "NGINX")

**Objetivos**:  
    - configurar um container  
    - mapear volume  
    - salvar a imagem  
    - mais comandos  
//    - enviar para o docker hub  

**Resumo**:  
Será criado um ambiente a partir de uma imagem Ubuntu 16.04 e será instalado o servidor [NGINX](https://www.nginx.com/). 

## Escolhendo a imagem

O [Docker Hub](https://hub.docker.com/) é um repositório de imagens para containers. São disponibilizadas [imagens oficiais](https://docs.docker.com/docker-hub/official_repos/) ou imagens compartilhadas por [usuários](https://hub.docker.com/u/vconrado).

## Executando o container 

```bash
docker run --name nginx1 ubuntu:16.04
```
Documentação [**docker run**](https://docs.docker.com/engine/reference/commandline/run/).

Rodando o *bash* no container 
```bash
docker run -it --name nginx1 ubuntu:16.04 bash
```

Veja os processos que estão rodando no ambiente:
```bash
ps -ef
```

## Instalando o ngnix
No **terminal do container**, digite: 
```bash
apt-get update
apt-get install -y nginx
/etc/init.d/nginx start
```

Para descobrir o IP do container, digite **terminal do seu computador**:
```bash
docker inspect nginx1
```

Abra o brower e aponte para o **IP do container nginx**.

---
![Welcome nginx!](../imgs/welcome_nginx.png "Welcome nginx!")
---


## Salvando a imagem do container
```bash
docker commit nginx1 nginx:1.0
```

## Removendo e criando novo container com a imagem salva

Removendo ...
```bash
docker stop nginx
docker rm nginx
docker ps -a
```

Executando ...
```bash
docker run -it --name nginx2 nginx:1.0 bash
/etc/init.d/nginx start
```

Mais um ...
```bash
docker run -it --name nginx3 nginx:1.0 bash
/etc/init.d/nginx start
```

Abra o browser e confira se os dois estão funcionando.

# Mapeando arquivos do host no container
```bash
docker run -it --name nginx4 -v $PWD/html/:/var/www/html nginx:1.0 bash
ls /var/www/html
/etc/init.d/nginx start
```

Saida do container digitando:
```bash
exit

# Reiniciando o container
```bash
docker start nginx4
```

# Vinculando ao terminal do container
```bash
docker attach nginx4
```

# Saindo do container sem finalizá-lo
```bash
Ctrl+p+q
```

# Executando novo terminal em container em execução
```bash
docker exec -it nginx4 bash
ps -ef
```


