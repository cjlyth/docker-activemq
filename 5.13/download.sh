#!/bin/bash

source /etc/profile.d/10proxy.sh

gpg --batch --quiet --no-tty --no-greeting --yes \
    --keyserver pool.sks-keyservers.net  --recv-keys 6A70C608

mkdir -p  $PRODUCT_HOME 							

curl -sSL $PRODUCT_BIN_URL -o $PRODUCT_NAME.tar.gz 	

curl -sSL $PRODUCT_SIG_URL 							\
  | gpgv --keyring ~/.gnupg/pubring.gpg 				\
  		      - $PRODUCT_NAME.tar.gz					

tar -xf   $PRODUCT_NAME.tar.gz 						\
 		-C    $PRODUCT_HOME 							\
 		--strip-components=1 							\
 		--exclude="macosx"								\
		--exclude="examples"							\
		--exclude="webapps-demo"						\
		--exclude="docs"								

rm -f $PRODUCT_NAME.tar.gz

