# Docker bitcoin

Dockerfile of the public image [BitcoinDeveloperNetwork/docker-omnicore:latest]()

Pull the image:

```bash
$ docker pull BitcoinDeveloperNetwork/docker-omnicore
```

Run the container:

```bash
$ docker run -p 19001:19001 -v path/to/bitcoin.conf:/config -d BitcoinDeveloperNetwork/docker-omnicore
```
