FROM debian:stable-slim as builder

# VERSION of BItcoin Core to be build
ARG VERSION=0.21.1

RUN apt-get update && apt-get install -y wget

RUN wget -qO- https://bitcoincore.org/bin/bitcoin-core-$VERSION/bitcoin-$VERSION-x86_64-linux-gnu.tar.gz | tar -xvz

RUN mv /bitcoin-$VERSION/bin/bitcoind /
RUN mv /bitcoin-$VERSION/bin/bitcoin-cli /

FROM debian:stable-slim

RUN useradd -ms /bin/bash bitcoin
USER bitcoin


COPY --from=builder /bitcoind /usr/bin/bitcoind
COPY --from=builder /bitcoin-cli /usr/bin/bitcoin-cli


EXPOSE 19001
STOPSIGNAL SIGINT

# Prevents `VOLUME $HOME/.bitcoin/` being created as owned by `root`
RUN mkdir -p "$HOME/.bitcoin/"

ENTRYPOINT [ "bitcoind" ]

