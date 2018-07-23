FROM java:8
# Set environment variables
ENV GLASSFISH_PKG=/tmp/latest-glassfish.zip \
    GLASSFISH_URL=http://download.oracle.com/glassfish/5.0/nightly/latest-glassfish.zip \
    GLASSFISH_HOME=/usr/local/glassfish5 \
    PATH=$PATH:/usr/local/glassfish5/bin

RUN apt-get update -y && apt-get upgrade -y && apt-get install unzip

# Download and install GlassFish
RUN wget -q -O $GLASSFISH_PKG $GLASSFISH_URL && \
    unzip -o $GLASSFISH_PKG -d /usr/local && \
    rm -f $GLASSFISH_PKG && \
    # Remove Windows .bat and .exe files to save space
    cd $GLASSFISH_HOME && \
    find . -name '*.bat' -delete && \
    find . -name '*.exe' -delete


WORKDIR /usr/local/glassfish5

# Copy in and set the entrypoint
#COPY docker-entrypoint.sh $GLASSFISH_HOME/
#ENTRYPOINT ["/usr/local/glassfish3/docker-entrypoint.sh"]

# Start the GlassFish domain
CMD ["asadmin", "start-domain", "--verbose"]

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.name="GlassFish" \
      org.label-schema.version="5.0" \
      org.label-schema.url="https://glassfish.java.net" \
      org.label-schema.vcs-url="https://github.com/ucalgary/docker-glassfish"
