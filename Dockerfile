FROM wordpress:6.5.2

# Instalar dependencias para WP-CLI y aumentar límite de carga de archivos
RUN apt-get update && apt-get install -y \
    less \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/* \
    && echo "upload_max_filesize = 200M" > /usr/local/etc/php/conf.d/uploads.ini \
    && echo "post_max_size = 200M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "memory_limit = 256M" >> /usr/local/etc/php/conf.d/uploads.ini

# Descargar e instalar WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp
