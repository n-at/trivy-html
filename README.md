# trivy + scan2html

* trivy + scan2html report generator in one image
* Vulnerability DBs saved in the image for offline use
* Local VEX Hub and reports browser

## Building

```bash
./build.sh
```

## Running

Scan image `ubuntu:20.04` from Docker Hub:

```bash
docker run --rm \
    -v $(pwd)/reports:/opt/reports/ \
    --network trivy-network \
    trivy-html ubuntu 20.04
```

Optional environment variables:

* `SCAN_IMAGE` (or first positional parameter)
* `SCAN_TAG` (or second positional parameter, default `latest`)
* `SCAN_FLAGS` (trivy image scan flags)

## Uses

* [aquasecurity/trivy](https://github.com/aquasecurity/trivy) - Apache-2.0
* [fatihtokus/scan2html](https://github.com/fatihtokus/scan2html) - Apache-2.0
* [nginx](https://github.com/nginx/nginx) - BSD-2-Clause
