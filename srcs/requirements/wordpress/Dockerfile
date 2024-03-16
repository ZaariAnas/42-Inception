FROM debian:bullseye

RUN apt-get install -y php7.4\
    php-fpm\
    php-mysql\
    curl\
    mariadb-client

COPY tools/script.sh script.sh 

CMD ["sh" ,"script.sh"]
