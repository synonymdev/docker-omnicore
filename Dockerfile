FROM debian:stable-slim as builder

RUN apt-get update && apt-get install -y wget

RUN mkdir -p /tmp /scripts

ADD install /scripts

RUN /scripts/install

FROM debian:stable-slim

COPY --from=builder /omnicored /usr/bin/omnicoded
COPY --from=builder /omnicore-cli /usr/bin/omnicore-cli

RUN useradd -ms /bin/bash ubuntu
USER ubuntu

EXPOSE 19001
STOPSIGNAL SIGINT

ENTRYPOINT ["omnicored"]
CMD ["-datadir=/config"]
