From tomcat:8.5.72-jdk17-openjdk-buster
add /var/lib/jenkins/workspace/package/targer /usr/local/tomcat/webapps
expose 8080
CMD ["catalina.sh", "run"]
