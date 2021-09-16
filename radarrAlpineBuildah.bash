#!/bin/bash
build0=$(buildah from alpine:3)
buildah run "$build0" sh -c "apk add --no-cache --update curl \
  libmediainfo \
  icu \
  sqlite-libs \
  jq &&\
  mkdir -p /app/radarr/bin \
  /config \
  /movies &&\
  curl -sL 'https://radarr.servarr.com/v1/update/master/updatefile?os=linuxmusl&runtime=netcore&arch=x64' | \
  tar xz -C /app/radarr/bin --strip-components=1 &&\
  rm -rf /tmp/* /app/radarr/bin/Radarr.Update &&\
  apk del apk-tools curl -q"
buildah config --entrypoint "/app/radarr/bin/Radarr -nobrowser -data=/config" "$build0"
buildah commit --rm "$build0" radarr-alpine-container:latest
