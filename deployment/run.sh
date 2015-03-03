#!/bin/bash
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

echo Running from $DIR

sudo -u fpai nohup java \
        -Dfelix.config.properties="file:$DIR/etc/config.properties" \
        -Dfelix.cm.dir="$DIR/config" \
        -Djava.security.policy="$DIR/etc/all.policy" \
        -Dlogback.configurationFile="$DIR/etc/logback.xml" \
        -jar "$DIR/org.apache.felix.main-4.6.0.jar" \
        > /dev/null &
