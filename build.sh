#!/bin/bash

cd trivy

docker image build -t trivy-html .

cd ..

mkdir vexhub && cd vexhub
mkdir -m 0777 data manifest
wget -O "data/main.zip" "https://github.com/aquasecurity/vexhub/archive/refs/heads/main.zip"
wget -O "manifest/vex-repository.json" "https://github.com/aquasecurity/vexhub/raw/refs/heads/main/vex-repository.json"

cd ..

mkdir -m 0777 reports

docker network create trivy-network

docker compose up -d
