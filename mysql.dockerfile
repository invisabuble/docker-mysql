# MYSQL
FROM mysql:9.2

# Copy in the SSL certificates.
COPY ./docker-apache/web/private/certs/mysql.key /etc/mysql/certs/mysql.key
COPY ./docker-apache/web/private/certs/mysql.crt /etc/mysql/certs/mysql.crt
COPY ./docker-apache/web/private/certs/SSL-root.crt /etc/mysql/certs/SSL-root.crt

# Fix ownership and permissions
RUN chown -R mysql:mysql /etc/mysql/certs \
    && chmod 600 /etc/mysql/certs/mysql.key \
    && chmod 644 /etc/mysql/certs/mysql.crt /etc/mysql/certs/SSL-root.crt