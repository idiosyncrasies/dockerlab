FROM node:6.14.2-alpine

ARG KIBANA_VERSION=6.2.4

ENV PATH /kibana/bin:$PATH

RUN apk add --update --no-cache \
        bash \
        curl \
        fontconfig \
        freetype \
    && rm -rf /var/cache/apk/*

WORKDIR /kibana

RUN curl -SL https://artifacts.elastic.co/downloads/kibana/kibana-$KIBANA_VERSION-linux-x86_64.tar.gz | \
    tar -zxf - && \
    mv kibana-$KIBANA_VERSION-linux-x86_64/* /kibana/ && \
    rm -r kibana-$KIBANA_VERSION-linux-x86_64 && \
    addgroup -S kibana && \
    adduser -S -G kibana kibana && \
    chown -R kibana:kibana /kibana

USER kibana

COPY config/kibana.yml /kibana/config/kibana.yml

COPY bin/kibana /kibana/bin/kibana

COPY bin/kibana-docker /kibana/bin/kibana-docker

EXPOSE 5601

CMD ["/kibana/bin/kibana-docker"]
