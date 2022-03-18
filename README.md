# Rode o script que vai baixar a branch do moodle e criar a imagem dos containers

```
./install.sh
```

# Escolhendo a versão da branch do Moodle

No arquivo .env coloque a versão do moodle na variável de ambiente MOODLE_VERSION

** Faça isso antes de rodar o docker-compose up, para mudar de versão posteriormente utilize os comandos git dentro do container

# Execute os containers

```
docker-compose up
```

# Siga as instruções de instalação do moodle no navegador

URL: http://localhost:8000

Ao pedir as configurações para banco de dados são as seguintes

HOST: db
Database: moodle
User: moodle
Pass: moodle
