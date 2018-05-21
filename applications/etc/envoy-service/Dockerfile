FROM envoyproxy/envoy-alpine:latest

ENV SERVICE_NAME=service
ENV SERVICE_PORT=80
ENV ENVOY_ADMIN_PORT=9901
ENV ZIPKIN_ADDRESS=zipkin
ENV ZIPKIN_PORT=9411

RUN apk add --update --no-cache gettext && rm -rf /var/cache/apk/*

COPY envoy.template.yaml /etc/envoy.template.yaml

COPY envoy.sh /usr/local/bin/envoy.sh

RUN chmod a+x /usr/local/bin/envoy.sh

CMD ["/usr/local/bin/envoy.sh"]
