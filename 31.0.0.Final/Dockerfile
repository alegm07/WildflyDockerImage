FROM amazoncorretto:21-alpine3.19-jdk
WORKDIR /opt/
RUN wget https://github.com/wildfly/wildfly/releases/download/31.0.0.Final/wildfly-31.0.0.Final.tar.gz
RUN tar -xvzf wildfly-31.0.0.Final.tar.gz -C /opt/
RUN mv wildfly-31.0.0.Final wildfly
ENV STANDALONE_XML /opt/wildfly/standalone/configuration/standalone.xml
RUN sed -i 's|<inet-address value="\${jboss.bind.address.management:127.0.0.1}"/>|<inet-address value="\${jboss.bind.address.management:0.0.0.0}"/>|' $STANDALONE_XML && \
    sed -i 's|<inet-address value="\${jboss.bind.address:127.0.0.1}"/>|<inet-address value="\${jboss.bind.address:0.0.0.0}"/>|' $STANDALONE_XML
RUN rm wildfly-31.0.0.Final.tar.gz
COPY setup-user.sh /opt/setup-user.sh
ENTRYPOINT ["/opt/setup-user.sh"]

EXPOSE 8080 9990
CMD ["/opt/wildfly/bin/standalone.sh"]