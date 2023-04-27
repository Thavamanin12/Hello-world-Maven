FROM ubuntu:latest

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install openjdk-11-jdk wget

RUN mkdir /usr/local/tomcat

RUN apt-get install -y curl

RUN curl -O https://downloads.apache.org/tomcat/tomcat-10/v10.1.8/bin/apache-tomcat-10.1.8.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-10.1.8/* /usr/local/tomcat/.


WORKDIR /usr/local/tomcat/webapps
RUN curl -O -L https://github.com/Thavamanin12/Hello-world-Maven/tree/master/dist/Hello-world-app-1.0.0.war

EXPOSE 4000

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
