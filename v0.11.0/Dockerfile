FROM debian:stable-slim as builder

# VERSION of Omni Core to be build
ARG VERSION=0.11.0

RUN apt-get update && apt-get install -y wget

RUN wget -qO- https://github.com/OmniLayer/omnicore/releases/download/v$VERSION/omnicore-$VERSION-x86_64-linux-gnu.tar.gz | tar -xvz

RUN mv /omnicore-$VERSION/bin/omnicored /
RUN mv /omnicore-$VERSION/bin/omnicore-cli /

FROM debian:stable-slim

RUN useradd -ms /bin/bash bitcoin
USER bitcoin


COPY --from=builder /omnicored /usr/bin/bitcoind
COPY --from=builder /omnicore-cli /usr/bin/bitcoin-cli


EXPOSE 19001
STOPSIGNAL SIGINT

# Prevents `VOLUME $HOME/.bitcoin/` being created as owned by `root`
RUN mkdir -p "$HOME/.bitcoin/"

ENTRYPOINT [ "bitcoind" ]

