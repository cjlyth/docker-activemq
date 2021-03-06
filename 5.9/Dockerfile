FROM dockerfile/java:oracle-java8
MAINTAINER Christopher J Lyth <cjlyth@gmail.com>

ENV PRODUCT_VERSION 5.9.1
ENV PRODUCT_NAME apache-activemq
ENV PRODUCT_HOME /opt/$PRODUCT_NAME-$PRODUCT_VERSION

ENV PRODUCT_MIRROR https://repository.apache.org/content/repositories/releases/org/apache/activemq/apache-activemq
ENV PRODUCT_BIN_URL $PRODUCT_MIRROR/$PRODUCT_VERSION/$PRODUCT_NAME-$PRODUCT_VERSION-bin.tar.gz
ENV PRODUCT_SIG_URL $PRODUCT_BIN_URL.asc

COPY entrypoint.sh /

RUN gpg --batch --quiet --no-tty --no-greeting --yes 	\
		--keyserver pool.sks-keyservers.net  			\
		--recv-keys 6A70C608 							\
 && mkdir -p  $PRODUCT_HOME 							\
 && curl -sSL $PRODUCT_BIN_URL -o $PRODUCT_NAME.tar.gz 	\
 && curl -sSL $PRODUCT_SIG_URL 							\
  | gpgv --keyring ~/.gnupg/pubring.gpg 				\
  		      - $PRODUCT_NAME.tar.gz					\
 && tar -xf   $PRODUCT_NAME.tar.gz 						\
 		-C    $PRODUCT_HOME 							\
 		--strip-components=1 							\
 		--exclude="macosx"								\
		--exclude="examples"							\
		--exclude="webapps-demo"						\
		--exclude="docs"								\
 && rm -f $PRODUCT_NAME.tar.gz 							\
 && chmod +x /entrypoint.sh 							\
 && ln -s 	 /entrypoint.sh 							\
 		  	 /usr/local/bin/activemq

EXPOSE 61616 61614 61613 8161 5672 1883

ENV PATH $PATH:$PRODUCT_HOME/bin
ENTRYPOINT ["/entrypoint.sh"]
CMD ["activemq", "console"]
