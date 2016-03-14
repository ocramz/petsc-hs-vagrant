# # ALPINE
# FROM gliderlabs/alpine:3.3
# RUN apk add --no-cache curl dpkg wget unzip tar bash 

# # DEBIAN
FROM debian:7.7
# RUN apt-get -qq install -y --no-install-recommends ca-certificates debian-keyring debian-archive-keyring
RUN apt-get update
RUN apt-get install -y --no-install-recommends wget

# # env variables
ENV VAGRANT_VER 1.8.1

# directory paths
ENV DPKG_DIR /var/lib/dpkg

# # mkdir
RUN mkdir -p ${DPKG_DIR}



# # Vagrant
RUN wget https://releases.hashicorp.com/vagrant/${VAGRANT_VER}/vagrant_${VAGRANT_VER}_x86_64.deb -O vagrant.deb

RUN dpkg -i vagrant.deb
# RUN rm vagrant.deb