# Docker bitcoin

Dockerfile of the public image [vulpemventures/bitcoin:latest]()

Pull the image:

```bash
$ docker pull vulpemventures/bitcoin
```

Run the container:

```bash
$ docker run -p 19001:19001 -v path/to/bitcoin.conf:/config -d vulpemventures/bitcoin
```