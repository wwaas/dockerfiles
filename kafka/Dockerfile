FROM openjdk:8u151-jre-alpine

LABEL maintainer="tsund" \
    email="tsund@qq.com" \
    description="Apache Kafka Docker Image"

ARG kafka_version=2.4.1 
ARG scala_version=2.11

ENV KAFKA_VERSION=$kafka_version \
    SCALA_VERSION=$scala_version

COPY download-kafka.sh server.properties /tmp/

RUN apk add --no-cache bash \
    && mkdir /opt \
    && chmod a+x /tmp/download-kafka.sh \
    && /tmp/download-kafka.sh \
    && tar -zxf /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
    && mv /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION} /opt/kafka \
    && rm /tmp/* \
    && mkdir /opt/kafka/data \
    && mv server.properties /opt/kafka/config

CMD ["/opt/kafka/bin/start-kafka.sh /opt/kakfa/config/server.properties"]
