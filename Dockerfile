FROM alpine as fetch
RUN ["/usr/bin/wget", "-cO", "/tmp/rke", "https://github.com/rancher/rke/releases/download/v1.0.5/rke_linux-amd64"]
RUN ["/bin/chmod", "+x", "/tmp/rke"]

FROM busybox
LABEL maintainer="Peronnet Mattéo <matteo-peronnet@hotmail.fr>"
COPY --from=fetch /tmp/rke /usr/local/bin/rke
CMD ["/usr/local/bin/rke", "--help"]
