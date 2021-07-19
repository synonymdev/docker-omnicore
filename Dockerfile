FROM debian:stable-slim as builder

RUN apt-get update && apt-get install -y wget

RUN mkdir -p /tmp /scripts

ADD install /scripts

RUN /scripts/install

FROM debian:stable-slim

COPY --from=builder /omnicored /usr/bin/bitcoind
COPY --from=builder /omnicore-cli /usr/bin/bitcoin-cli

RUN useradd -ms /bin/bash ubuntu
USER ubuntu

EXPOSE 19001
STOPSIGNAL SIGINT

ENTRYPOINT ["bitcoind"]
CMD ["-datadir=/config"]
