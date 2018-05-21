FROM envoyproxy/envoy-alpine:latest

RUN apk add --update --no-cache curl && rm -rf /var/cache/apk

COPY bin/wait-for /bin/wait-for

COPY etc/envoy.yaml /etc/envoy/envoy.yaml

CMD sh -c '/bin/wait-for zipkin:9411 --timeout=360 -- /usr/local/bin/envoy -c /etc/envoy/envoy.yaml --service-cluster front-proxy'
