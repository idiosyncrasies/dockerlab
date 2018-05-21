FROM openzipkin/jre-full:1.8.0_152

ARG ELASTICSEARCH_VERSION=6.2.4

ENV PATH /elasticsearch/bin:$PATH

ENV ES_PATH_CONF=/elasticsearch/config

ENV JAVA_OPTS=

RUN apk add --update --no-cache \
        coreutils \
        bash \
        curl \
    && rm -rf /var/cache/apk/*

WORKDIR /elasticsearch

RUN curl -SL \
        https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ELASTICSEARCH_VERSION.tar.gz | \
        tar xz \
    && mv elasticsearch-$ELASTICSEARCH_VERSION/* /elasticsearch/ \
    && rm -r elasticsearch-$ELASTICSEARCH_VERSION \
    && mkdir /elasticsearch/data \
    && addgroup -S elasticsearch \
    && adduser -S -G elasticsearch elasticsearch \
    && chown -R elasticsearch:elasticsearch /elasticsearch

# elasticsearch complains if run as root
USER elasticsearch

COPY config ./config

EXPOSE 9200 9300

VOLUME ["/elasticsearch/data"]

CMD ["/elasticsearch/bin/elasticsearch"]
