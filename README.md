# trivy + scan2html

```bash
docker run --rm \
    -v $(pwd)/reports:/opt/reports/ \
    --network trivy-network \
    trivy-html ubuntu 20.04
```

Environment variables:

* `SCAN_IMAGE` (or first positional parameter)
* `SCAN_TAG` (or second positional parameter, default `latest`)
* `SCAN_FLAGS` (trivy image scan flags)
