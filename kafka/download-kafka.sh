#!/bin/bash

red='\e[91m'
none='\e[0m'

KAFKA_VERSION=2.4.1
SCALA_VERSION=2.11

filename="kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz"
url="https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/${filename}"

echo -e "${read}Downloading Kafka from ${url}${none}"
wget "${url}" -O "/tmp/${filename}"
