# Usa a imagem oficial do PHP 8.2 com Apache
FROM php:8.2-apache

# Atualiza pacotes e instala extensões PHP para PostgreSQL e MySQL
RUN apt-get update && apt-get install -y libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql pgsql pdo_mysql mysqli \
    && a2enmod rewrite

# Copia os arquivos do projeto
COPY ./CRUD /var/www/html

# Ajusta permissões dos arquivos
RUN chown -R www-data:www-data /var/www/html 

