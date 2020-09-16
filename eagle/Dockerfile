FROM openjdk:8u151-jre-alpine

LABEL maintainer="tsund" \
    email="tsund@qq.com" \
    version="2.0.1" \
    description="Kafka Eagle Docker Image"

ENV version="2.0.1"

RUN apt-get update && apt-get install -y --no-install-recommends curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/* &&  cd /tmp \
    && curl -L "https://github.com/smartloli/kafka-eagle-bin/archive/v${version}.tar.gz" > eagle.tar.gz --progress \
    && tar -zxf eagle.tar.gz && tar -zxf kafka-eagle-bin-${version}/kafka-eagle-web-${version}-bin.tar.gz \
    && mv kafka-eagle-web-${version} /eagle \
    && chmod +x /eagle/bin/ke.sh && rm -rf /tmp/*

VOLUME [ "/eagle/conf", "/eagle/db", "/eagle/logs" ]

EXPOSE 8048

CMD [ "sh", "/eagle/bin/ke.sh" ]
