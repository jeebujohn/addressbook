From tomcat:8.5.72-jdk17-openjdk-buster
add target/addressbook.war /usr/local/tomcat/webapps
expose 8090
CMD ["catalina.sh", "run"]
