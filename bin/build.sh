#!/bin/bash

jdk_url="http://download.oracle.com/otn-pub/java/jdk/${JDK_VERSION_WITH_BUILD}/jdk-${JDK_VERSION}-linux-x64.tar.gz"

mkdir -p .jdk

echo ${jdk_url}
curl -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" "${jdk_url}" | \
  tar xz -C ".jdk" --strip-components=1

cd .jdk

find . -name *.so -exec objcopy --strip-unneeded {} \; #remove debug from .so files

./bin/java -version > version.txt
echo "${JDK_TAG}" > tag.txt

# Install Unlimited JCE
cp ${JAVA_HOME}/jre/lib/security/*.jar jre/lib/security/

TARFILE="jdk.tgz"
tar czf $TARFILE --exclude='demo' --exclude='src.zip' --exclude='sample' \
    --exclude='man' --exclude='$TARFILE' --ignore-failed-read *

mv $TARFILE ../builds/oracle-jdk-${JDK_VERSION}.tar.gz

cd ../

rm -rf .jdk
