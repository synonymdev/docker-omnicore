FROM ubuntu:18.04

RUN apt-get update && \
	apt-get install --yes software-properties-common && \
	add-apt-repository --yes ppa:bitcoin/bitcoin && \
	apt-get update && \
	apt-get install --yes bitcoind

EXPOSE 19001
STOPSIGNAL SIGINT

ENTRYPOINT ["bitcoind"]
CMD ["-datadir=/config"]