FROM gliderlabs/alpine:3.3
RUN apk add --no-cache curl wget unzip dpkg tar bash 

# # env variables
ENV VAGRANT_VER 1.8.1

# directory paths
ENV DPKG_DIR /var/lib/dpkg


# # mkdir
RUN mkdir -p ${DPKG_DIR}



# # Vagrant
RUN curl -O https://releases.hashicorp.com/vagrant/${VAGRANT_VER}/vagrant_${VAGRANT_VER}_x86_64.deb

# RUN dpkg -i vagrant_${VAGRANT_VER}_x86_64.deb
# RUN rm vagrant_*.deb