# Tor socks proxy
## CLI commands
## Docker commands
### Build tagged image in local directory without cache
```bash
docker build \
    --no-cache \
    --build-arg DEBIAN_VERSION=stable-slim \
    --file Dockerfile \
    --tag image-name:latest .
```
### Create and run automatically container
```bash
docker container run \
    --interactive \
    --tty \
    --name container-name och6z/tor-proxy
```
### Run Bash in running container
```bash
docker container exec \
    --interactive \
    --tty \
    container-id /bin/bash
```
## Tor commands
### Start Tor process
```bash
tor &
```
### Start Tor process in the background
```bash
tor --runasdaemon 1
```
### Application use only Tor for internet connectivity
```bash
torify command
```
### Set current shell in Tor mode
```bash
. torsocks on
```
