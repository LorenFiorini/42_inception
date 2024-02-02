

FROM debian:bullseye

RUN apt update
RUN apt install -y curl wget sudo unzip \
	mariadb-client fcgiwrap php \
	php-fpm php-mysqli php-json php-curl php-dom \
	php-exif php-fileinfo php-mbstring \
	php-xml php-zip php-redis php-cli php-phar \
	default-mysql-client php-mysql 

COPY ./tools/script_0.sh /script_0.sh
RUN chmod +x /script_0.sh

ENTRYPOINT ["/script_0.sh"]
