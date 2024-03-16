FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y wget php7.4-fpm php-mysql
RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.4/fpm/pool.d/www.conf
RUN mkdir -p /run/php
COPY tools/script.sh script.sh 

CMD ["bash" ,"script.sh"]
