

# FROM debian:bullseye
FROM debian:oldstable


RUN apt update
RUN apt install -y curl wget sudo unzip \
	mariadb-client fcgiwrap php \
	php-fpm php-mysqli php-json php-curl php-dom \
	php-exif php-fileinfo php-mbstring \
	php-xml php-zip php-redis php-cli php-phar \
	default-mysql-client php-mysql 

RUN apt install -y nginx openssl

COPY ./tools/script_1.sh /script.sh
RUN chmod +x /script.sh

ENTRYPOINT ["/script.sh"]
