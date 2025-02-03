#!/bin/bash

cd trivy

mkdir db && cd db

wget -O oras.tar.gz "https://github.com/oras-project/oras/releases/download/v1.2.2/oras_1.2.2_linux_amd64.tar.gz"
tar -xf oras.tar.gz

./oras pull ghcr.io/aquasecurity/trivy-db:2
./oras pull ghcr.io/aquasecurity/trivy-java-db:1
./oras pull ghcr.io/aquasecurity/trivy-checks:0

tar -xf db.tar.gz
tar -xf javadb.tar.gz
tar -xf bundle.tar.gz

rm oras LICENSE oras.tar.gz db.tar.gz javadb.tar.gz bundle.tar.gz

cd ..

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
