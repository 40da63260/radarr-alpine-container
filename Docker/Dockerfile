FROM alpine:3
RUN apk add --no-cache -q --update curl \
  libmediainfo \
  icu \
  sqlite-libs \
  jq
RUN mkdir -p /app/radarr/bin \
  /config \
  /movies 
RUN curl -sL 'https://radarr.servarr.com/v1/update/master/updatefile?os=linuxmusl&runtime=netcore&arch=x64' | \
  tar xz -C /app/radarr/bin --strip-components=1
RUN rm -rf /tmp/* /app/radarr/bin/Radarr.Update
RUN apk del apk-tools curl -q
ENTRYPOINT ["/app/radarr/bin/Radarr","-nobrowser","-data=/config"]
