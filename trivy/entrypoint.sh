#!/bin/sh

SCAN_IMAGE=${SCAN_IMAGE:-$1}

if [ -z "${SCAN_IMAGE}" ]; then
    echo "SCAN_IMAGE required"
    exit 1
fi

SCAN_TAG=${SCAN_TAG:-$2}
SCAN_TAG=${SCAN_TAG:-"latest"}

OUTPUT_IMAGE=$(echo "${SCAN_IMAGE}" | tr -c '[:alnum:]-_\r\n' '-')
OUTPUT_TAG=$(echo "${SCAN_TAG}" | tr -c '[:alnum:]-_\r\n' '-')
OUTPUT_REPORT_DATE="$(date +'%Y-%m-%d-%H-%M-%S')"

mkdir -p "/opt/reports/${OUTPUT_IMAGE}/${OUTPUT_TAG}/"

trivy scan2html image \
    --offline-scan --skip-db-update --skip-java-db-update \
    ${SCAN_FLAGS} \
    "${SCAN_IMAGE}:${SCAN_TAG}" \
    --scan2html-flags \
    --output "/opt/reports/${OUTPUT_IMAGE}/${OUTPUT_TAG}/${OUTPUT_REPORT_DATE}.html"
