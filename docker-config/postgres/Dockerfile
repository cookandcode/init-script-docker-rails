FROM postgres:9.6
COPY ./docker-config/postgres/user-script.sh /docker-entrypoint-initdb.d/init-user-db.sh
RUN chmod +x /docker-entrypoint-initdb.d/init-user-db.sh
