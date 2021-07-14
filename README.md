# Docker bitcoin

Dockerfile of the public image [synonymsoft/docker-omnicore:latest]()

Pull the image:

```bash
$ docker pull synonymsoft/docker-omnicore
```

Run the container:

```bash
$ docker run -p 19001:19001 -v path/to/bitcoin.conf:/config -d synonymsoft/docker-omnicore
```
