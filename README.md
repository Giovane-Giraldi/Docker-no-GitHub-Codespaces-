# Docker-no-GitHub-Codespaces-
 
## 1. Identificação 
Giovane Giraldi 
 
## 2. Docker no Codespaces 
Docker version 29.3.0-1,
 
## 3. Contêiner Nginx 
Foi utilizada a imagem nginx:latest para criar o contêiner meu_nginx, com a porta 8080 do Codespaces direcionada para a porta 80 do Nginx. O acesso foi realizado pelo navegador e também foi verificado o conteúdo do diretório padrão do Nginx. 
## 4. Imagem personalizada 
Foi criado um Dockerfile baseado em ubuntu:24.04, que copia o arquivo hello.txt para a imagem.
Imagem criada: aula-docker:1.0
O comando docker run --rm aula-docker:1.0 exibiu no terminal a mensagem armazenada em hello.txt.
 
"Olá! Esta imagem Docker foi criada na aula de Integração e Entrega Contínua."

## 5. Docker Compose 
 Os serviços MySQL e phpMyAdmin foram executados utilizando Docker Compose.

Resultado de docker compose ps:

NAME              IMAGE               COMMAND                  SERVICE      CREATED          STATUS          PORTS
aula-mysql        mysql:8.4           "docker-entrypoint.s…"   mysql        15 minutes ago   Up 15 minutes   0.0.0.0:3306->3306/tcp, [::]:3306->3306/tcp, 33060/tcp
aula-phpmyadmin   phpmyadmin:latest   "/docker-entrypoint.…"   phpmyadmin   15 minutes ago   Up 15 minutes   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp

O phpMyAdmin foi acessado pela porta 8080 e o banco aula_db foi confirmado.

## 6. Persistência 
A tabela mensagem continuou existindo após docker compose down e docker compose up -d porque os dados foram armazenados no volume mysql-data. O comando docker compose down remove os contêineres, mas mantém o volume.
 
## 7. Evidências 

Versão e informações do Docker: 
"Docker version 29.3.0-1"

Execução do Nginx: 
"latest: Pulling from library/nginx"

Criação e execução da imagem personalizada:
"IMAGE          ID             DISK USAGE   CONTENT SIZE   EXTRA
nginx:latest   b34848eff6db        241MB         66.2MB"

Execução do MySQL e phpMyAdmin:
"NAME              IMAGE               COMMAND                  SERVICE      CREATED          STATUS          PORTS
aula-mysql        mysql:8.4           "docker-entrypoint.s…"   mysql        13 seconds ago   Up 12 seconds   0.0.0.0:3306->3306/tcp, [::]:3306->3306/tcp, 33060/tcp
aula-phpmyadmin   phpmyadmin:latest   "/docker-entrypoint.…"   phpmyadmin   13 seconds ago   Up 12 seconds   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp"

# Perguntas
## 1. Qual é a diferença entre uma imagem Docker e um contêiner?

A imagem é o modelo usado para criar um contêiner. O contêiner é uma instância da imagem em execução.

## 2. O que significa o mapeamento de portas 8080:80?

A porta 8080 do ambiente é direcionada para a porta 80 dentro do contêiner.

## 3. Qual é a função do Dockerfile neste exercício?

O Dockerfile define as instruções utilizadas para criar a imagem personalizada aula-docker:1.0.

## 4. Por que o serviço phpMyAdmin consegue acessar o MySQL usando PMA_HOST: mysql?

Porque mysql é o nome do serviço definido no Docker Compose, permitindo que o phpMyAdmin encontre o MySQL pela rede interna do Compose.

## 5. Qual é a função do volume mysql-data?

O volume armazena os dados do MySQL de forma persistente, permitindo que eles continuem existindo mesmo após a remoção dos contêineres.

## 6. O que aconteceria com os dados se o ambiente fosse encerrado com docker compose down -v?

O volume também seria removido e, consequentemente, os dados armazenados nele seriam apagados.