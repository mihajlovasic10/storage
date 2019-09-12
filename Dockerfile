FROM jetty:9.4.7
COPY /target/storage.war /var/lib/jetty/webapps/storage.war