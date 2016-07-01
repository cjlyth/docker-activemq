FROM java:8
MAINTAINER Christopher J Lyth <cjlyth@gmail.com>

ENV PRODUCT_VERSION 5.13.3
ENV PRODUCT_NAME apache-activemq
ENV PRODUCT_HOME /opt/$PRODUCT_NAME-$PRODUCT_VERSION

ENV PRODUCT_MIRROR https://repository.apache.org/content/repositories/releases/org/apache/activemq/apache-activemq
ENV PRODUCT_BIN_URL $PRODUCT_MIRROR/$PRODUCT_VERSION/$PRODUCT_NAME-$PRODUCT_VERSION-bin.tar.gz
ENV PRODUCT_SIG_URL $PRODUCT_BIN_URL.asc

COPY proxy-info /etc/profile.d/10proxy.sh

COPY entrypoint.sh /
COPY download.sh /

RUN bash /download.sh

RUN chmod +x /entrypoint.sh 							

RUN ln -s 	 /entrypoint.sh 							\
 		  	 /usr/local/bin/activemq

EXPOSE 61616 61614 61613 8161 5672 1883

ENV PATH $PATH:$PRODUCT_HOME/bin
ENTRYPOINT ["/entrypoint.sh"]
CMD ["activemq", "console"]
