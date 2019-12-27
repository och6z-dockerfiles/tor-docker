ARG CODE_VERSION=stable-slim

FROM debian:${CODE_VERSION}

ENV TOR_DEB deb.torproject.org
ENV TOR_KEY A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89
ENV DIST stable

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    gnupg \
    curl && \
    echo "deb https://${TOR_DEB}/torproject.org ${DIST} main" >> /etc/apt/sources.list && \
    echo "deb-src https://${TOR_DEB}/torproject.org ${DIST} main" >> /etc/apt/sources.list && \
    curl https://${TOR_DEB}/torproject.org/${TOR_KEY}.asc | gpg --import && \
    gpg --export ${TOR_KEY} | apt-key add - && \
    apt-get update -y && \
    apt-get install -y tor ${TOR_DEB}-keyring && apt-get remove -y gnupg && rm -fr root/.gnupg && \
    apt-get purge -y && apt-get autoremove -y && apt-get autoclean -y
