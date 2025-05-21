FROM tomcat:9-jre9 
MAINTAINER "manojshetty5769@gmail.com"
COPY ./target/blood_bank.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8081