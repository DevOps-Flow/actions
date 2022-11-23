#!/bin/bash
set -e
echo "${MAVEN_SETTINGS}" > /code/maven-settings.xml
mvn -s /code/maven-settings.xml clean package -DskipTests ${EXTRA_ARGS} -X