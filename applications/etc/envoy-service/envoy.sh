#!/usr/bin/env sh

# shellcheck disable=SC2016
shell_format='${SERVICE_NAME} ${SERVICE_PORT} ${ENVOY_ADMIN_PORT} ${ZIPKIN_ADDRESS} ${ZIPKIN_PORT}'

envsubst "$shell_format" < /etc/envoy.template.yaml > /etc/envoy/envoy.yaml

/usr/local/bin/envoy -c /etc/envoy/envoy.yaml --service-cluster "service${SERVICE_NAME}"
