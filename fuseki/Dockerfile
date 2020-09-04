FROM openjdk:11-jre-slim-buster

LABEL maintainer="tsund"
LABEL email="tsund@qq.com"
LABEL version="3.14.0"
LABEL description="Apache Jena Fuseki Docker Image"

RUN apt-get update && apt-get install -y --no-install-recommends \
    findutils coreutils pwgen && rm -rf /var/lib/apt/lists/*

ENV FUSEKI_VERSION=3.14.0
ENV FUSEKI_HOME=/fuseki
ENV FUSEKI_BASE=${FUSEKI_HOME}/run
ENV FUSEKI_LOC=/loc

VOLUME /tdb

COPY apache-jena-fuseki-${FUSEKI_VERSION}.tar.gz ${FUSEKI_LOC}/fuseki.tar.gz
COPY shiro.ini /
COPY config.ttl /
COPY docker-entrypoint.sh /

RUN cd ${FUSEKI_LOC} && chmod +x docker-entrypoint.sh && tar -zxf fuseki.tar.gz \
    && mv apache-jena-fuseki* ${FUSEKI_HOME} && rm -rf *.gz \
    && cd ${FUSEKI_HOME} && rm -rf fuseki.war && chmod +x fuseki-server

RUN cd ${FUSEKI_HOME} && (nohup ./fuseki-server > /tmp/out.txt &) \
    && kill -9 $(ps -aux | grep fuseki-server| grep -v grep | awk '{print $2}') \
    && rm -rf /tmp/out.txt

EXPOSE 3030
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["${FUSEKI_HOME}/fuseki-server"]
