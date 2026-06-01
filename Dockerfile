FROM tomcat:10.1-jdk17

COPY target/URLShortener-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/

EXPOSE 8080