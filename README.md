# trivy + scan2html

```bash
docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(pwd)/cache:/root/.cache/ \
    -v $(pwd)/reports:/opt/reports/ \
    --network trivy-network \
    trivy-html alpine latest
```
