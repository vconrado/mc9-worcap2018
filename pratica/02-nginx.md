# Preparando um container com NGINX

![NGINX](../imgs/nginx.jpg "NGINX")

**Objetivos**:  
    - configurar um container  
    - mapear volume  
    - salvar a imagem  
    - mais comandos  

**Resumo**:  
Será criado um ambiente a partir de uma imagem Ubuntu 16.04 e será instalado o servidor [NGINX](https://www.nginx.com/). 

## 1. Escolhendo a imagem

O [Docker Hub](https://hub.docker.com/) é um repositório de imagens para containers. São disponibilizadas [imagens oficiais](https://docs.docker.com/docker-hub/official_repos/) ou imagens compartilhadas por [usuários](https://hub.docker.com/u/vconrado).

## 2. Executando o container 

```bash
docker run --name nginx1 ubuntu:16.04
```
Documentação [**docker run**](https://docs.docker.com/engine/reference/commandline/run/).

Removendo o container:
```bash
docker rm nginx1
```

Rodando o *bash* no container 
```bash
docker run -it --name nginx1 ubuntu:16.04 bash
```

Veja os processos que estão rodando no ambiente:
```bash
ps -ef
```

## 3. Instalando o ngnix
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


## 4. Salvando a imagem do container
```bash
docker commit nginx1 nginx:1.0
```

## 5. Removendo e criando novo container com a imagem salva

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

![Image container](../imgs/image_container.png "Image container")


## 6. Mapeando portas entre container e host

É possível associar uma porta do host em uma porta do container, para isso faça:

````bash
docker run -it -p 8080:80 --name nginx4 nginx:1.0 bash
````
Abra o browser apontando para o endereço do seu host [http://127.0.0.1:8080](http://127.0.0.1:8080)	.
> Para usuários Windows, talvez seja necessário acessar através do IP da máquina virtual [http://192.168.99.100:8080])(http://192.168.99.100:8080).

## 7. Mapeando arquivos do host no container
```bash
docker run -it --name nginx5 -v $PWD/html/:/var/www/html nginx:1.0 bash
ls /var/www/html
/etc/init.d/nginx start
```

Saida do container digitando:
```bash
exit
```

### 7.1 Iniciando novamente o container
```bash
docker start nginx5
```

### 7.2 Vinculando ao terminal do container
```bash
docker attach nginx5
```

## 8. Saindo do container sem finalizá-lo
```bash
Ctrl+p+q
```

## 9. Executando novo terminal em container em execução
```bash
docker exec -it nginx5 bash
ps -ef
```

## 10. Próximos passos

Acesse [aqui](03-dockerfile.md) a próxima atividade.


