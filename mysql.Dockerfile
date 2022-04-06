FROM mysql:5.7

COPY ./apps/database/ /docker-entrypoint-initdb.d/
