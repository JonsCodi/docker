# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "youremailaddress" 

# Copy to images tomcat path 
ADD web.xml /usr/local/tomcat/conf/ 
ADD obclient.properties /etc/ 
ADD WebClient.properties /etc/ 
ADD yourwarfile.war /usr/local/tomcat/webapps/ 
ADD settings.xml /usr/local/tomcat/conf/
ADD tomcat-users.xml /usr/local/tomcat/conf/
