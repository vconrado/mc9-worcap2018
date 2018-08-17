# Motivação

- Portabilidade 
- Controle de versão de imagens
- Reversão
- Implantação rápida
- Modularidade

[[1]](https://www.redhat.com/pt-br/topics/containers/what-is-docker)
# O que é um *container*? 
![Container](../imgs/container.jpg "Container")
---
Um container Linux é um conjunto de processos que são isolados do resto do sistema. Esses processos são executados a partir de uma imagem distinta que fornece todos os arquivos necessários a eles [[1]](https://www.redhat.com/pt-br/topics/containers/whats-a-linux-container).

![Container](https://www.redhat.com/cms/managed-files/what-is-a-container.png "Container")

O objetivo dos containers é criar essa independência: a habilidade de executar diversos processos e aplicativos separadamente para utilizar melhor a infraestrutura e, ao mesmo tempo, manter a segurança que você teria em sistemas separados.

# Virtualização *vs* *Container*
Não confunda Virtualização com Containers, sistemas virtualizados dependem de softwares virtualizadores para serem executados, sistemas “conteinerizados” depedem diretamente do sistema operacional e suas bibliotecas nativas e é claro, de alguma tecnologia que forneça ao sistema a capacidade de isolar e gerenciar grupos de processos (LXC ou Docker se preferir).

---

!["Virtualização vs Container"](https://www.redhat.com/cms/managed-files/virtualization-vs-containers.png "Virtualização vs Container")

# Imagem *vs* *Container*

# Docker
Em 2008, o Docker entrou em cena (por meio do dotCloud) com sua tecnologia de container homônima. A tecnologia docker é uma combinação do trabalho do LXC com as ferramentas aprimoradas para desenvolvedores, aumentando, assim, a facilidade da utilização dos containers. O docker, uma tecnologia open source, é atualmente o projeto e o método mais famoso para implantar e gerenciar containers Linux.

# Docker Hub

# Comandos básicos

# Prática 

Acesse o material da parte [prática](../pratica/01-hello-world.md).

# Fontes



