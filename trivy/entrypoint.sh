#!/bin/bash

SCAN_IMAGE=${SCAN_IMAGE:-$1}

if [ -z "${SCAN_IMAGE}" ]; then
    echo "SCAN_IMAGE required"
    exit 1
fi

SCAN_SCANNERS=${SCAN_SCANNERS:-"vuln,secret,misconfig,license"}

OUTPUT_IMAGE=$(echo "${SCAN_IMAGE}" | tr -c '[:alnum:]-_' '-')
OUTPUT_REPORT_DATE="$(date +'%Y-%m-%d-%H-%M-%S')"

trivy scan2html image \
    --scanners "${SCAN_SCANNERS}" \
    --offline-scan \
    "${SCAN_IMAGE}" \
    --scan2html-flags \
    --output "/opt/reports/${OUTPUT_IMAGE}-${OUTPUT_REPORT_DATE}.html"
