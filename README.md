# Docker bitcoin

Dockerfile of the public image [ghcr.io/vulpemventures/bitcoin:latest](https://github.com/orgs/vulpemventures/packages/container/package/bitcoin)


Pull the image:

```bash
$ docker pull ghcr.io/vulpemventures/bitcoin:latest
```

Run the image:

```bash
$ docker run -v path/to/bitcoin.conf:/home/bitcoin/.bitcoin -d ghcr.io/vulpemventures/bitcoin:latest
```


## Release

To tag a new image with a new version:

1) Create a new folder with `VERSION` as directory name
2) Modify the GH Action in `.github/workflows/docker-publish.yml` changing the ARG `VERSION` with new created folder
3) Push in master
