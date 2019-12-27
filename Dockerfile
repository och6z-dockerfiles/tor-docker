ARG CODE_VERSION=stable-slim

FROM debian:${CODE_VERSION}

ENV TOR_DEB deb.torproject.org
ENV TOR_KEY A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89

RUN apt update && \
    apt install -y --no-install-recommends apt-transport-https ca-certificates gnupg curl && \
    echo "deb https://deb.torproject.org/torproject.org stable main" >> /etc/apt/sources.list && \
    echo "deb-src https://deb.torproject.org/torproject.org stable main" >> /etc/apt/sources.list && \
    curl https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import && \
    gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add - && \
    apt update -y && \
    apt install -y tor deb.torproject.org-keyring && apt remove -y gnupg && \
    apt purge -y && apt autoremove -y && apt autoclean -y
