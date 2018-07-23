from alpine:3.7

MAINTAINER Jonas Gomes <jonas.fepam@ctz.com.br>

ENV WILDFLY_VERSION 13.0.0.Final
ENV JDK_VERSION 8

ENV WILDFLY_HOME /opt/wildfly
ENV DOWNLOAD_LOCATION http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz
ENV DOWNLOAD_LOCATION_POSTGRES https://jdbc.postgresql.org/download/postgresql-42.2.4.jar

ADD $DOWNLOAD_LOCATION $WILDFLY_HOME/wildfly-$WILDFLY_VERSION.tar.gz
ADD bootstrap.sh /bootstrap.sh

WORKDIR $WILDFLY_HOME

RUN apk update && \
    apk add openjdk$JDK_VERSION && \
    tar xzvf wildfly-$WILDFLY_VERSION.tar.gz && \
    cp -Rvf wildfly-$WILDFLY_VERSION/* $WILDFLY_HOME && \
    rm -rf wildfly-$WILDFLY_VERSION wildfly-$WILDFLY_VERSION.tar.gz && \
    chmod +x /bootstrap.sh && \
    apk add vim -y

ADD $DOWNLOAD_LOCATION_POSTGRES $WILDFLY_HOME
ADD module.xml $WILDFLY_HOME

WORKDIR modules/system/layers/base/org

RUN mkdir postgresql && cd postgresql && mkdir main

WORKDIR $WILDFLY_HOME

RUN mv module.xml modules/system/layers/base/org/postgresql/main
RUN mv postgresql-42.2.4.jar modules/system/layers/base/org/postgresql/main
RUN rm standalone/configuration/standalone.xml
ADD standalone.xml $WILDFLY_HOME
RUN mv standalone.xml standalone/configuration

CMD ["/bootstrap.sh"]
