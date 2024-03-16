FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY ./tools/script.sh .

CMD ["sh", "script.sh"]
