#!/bin/sh

export JDK_MAJOR="8"
export JDK_UPDATE="102"
export JDK_BUILD="14"

export JDK_VERSION="${JDK_MAJOR}u${JDK_UPDATE}"
export JDK_VERSION_WITH_BUILD="${JDK_MAJOR}u${JDK_UPDATE}-b${JDK_BUILD}"

docker-compose -f docker/oracle.yml build
docker-compose -f docker/oracle.yml run tar

echo ""
echo "Build complete!"
echo "Upload builds/oracle-jdk-${JDK_VERSION}.tar.gz to your server or S3 bucket"
echo "and run 'heroku config:set JDK_URL_1_8=' with the URL of the file."
