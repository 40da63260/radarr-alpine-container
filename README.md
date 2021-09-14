# radarr-alpine-container

[radarr](https://github.com/Radarr/Radarr) in an Alpine OCI Container

# What it is:

This as bare an image as I want to make for a container to be run as a non-root user. Only tested in podman.

# How to run:

`podman run --rm -it --name=radarr -p 7878:7878 -v /some/downloads:/downloads -v /some/tv/:/tv radarr-alpine-container`
