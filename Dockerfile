FROM debian:7.7

MAINTAINER Marco Zocca <surname dot name gmail>

# # tools

RUN apt-get update
RUN apt-get install -y wget curl dkms 

RUN apt-get install -y linux-headers-3.2.0-4-amd64  linux-headers-3.19.0 linux-image-3.2.0-4-amd64


# # following the procedure at https://www.virtualbox.org/wiki/Linux_Downloads

RUN echo "deb http://download.virtualbox.org/virtualbox/debian wheezy contrib" >> /etc/apt/sources.list

# RUN echo "deb http://download.virtualbox.org/virtualbox/debian wheezy-backports main" >> /etc/apt/sources.list

RUN wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -

RUN apt-get update
RUN apt-get install -y virtualbox-5.0

RUN /sbin/rcvboxdrv setup





# FROM blacklabelops/centos
# MAINTAINER Steffen Bleul <sbl@blacklabelops.com>

# # Need root to build image
# USER root

# # install dev tools
# RUN yum install -y \
#       unzip \
#       tar \
#       gzip \
#       sudo \
#       wget && \
#     yum clean all && rm -rf /var/cache/yum/*

# # install Hashicorp tools
# RUN export PACKER_VERSION=0.8.6 && \
#     export VAGRANT_VERSION=1.8.1 && \
#     export OTTO_VERSION=0.2.0 && \
#     export TERRAFORM_VERSION=0.6.11 && \
#     export ATLAS_CLI_VERSION=0.2.0 && \
#     # wget --directory-prefix=/tmp https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
#     # unzip /tmp/packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin && \

#     wget --directory-prefix=/tmp https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_x86_64.rpm && \
#     rpm -i /tmp/vagrant_${VAGRANT_VERSION}_x86_64.rpm && \

#     # wget --directory-prefix=/tmp https://releases.hashicorp.com/otto/${OTTO_VERSION}/otto_${OTTO_VERSION}_linux_amd64.zip && \
#     # unzip /tmp/otto_${OTTO_VERSION}_linux_amd64.zip -d /usr/local/bin && \
#     # wget --directory-prefix=/tmp https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
#     # unzip /tmp/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && \
#     # wget --directory-prefix=/tmp https://github.com/hashicorp/atlas-upload-cli/releases/download/v${ATLAS_CLI_VERSION}/atlas-upload-cli_${ATLAS_CLI_VERSION}_linux_amd64.tar.gz && \

#     ls -All /tmp && \

#     # tar xzf /tmp/atlas-upload-cli_${ATLAS_CLI_VERSION}_linux_amd64.tar.gz -C /usr/local/bin && \

#     rm -rf /tmp/*

# # install Virtualbox (Example version: 5.0.14_105127_el7-1)
# RUN export VIRTUALBOX_VERSION=latest && \
#     mkdir -p /opt/virtualbox && \
#     cd /etc/yum.repos.d/ && \
#     wget http://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo && \
#     yum install -y \
#       gcc \
#       dkms \
#       linux-headers-$(uname -r) \
#       kernel-uek-devel-$(uname -r) \
#       kernel-devel && \
#     yum -y groupinstall "Development Tools" && \
#     if  [ "${VIRTUALBOX_VERSION}" = "latest" ]; \
#       then yum install -y VirtualBox-5.0 ; \
#       else yum install -y VirtualBox-5.0-${VIRTUALBOX_VERSION} ; \
#     fi && \
#     yum autoremove -y \
#       tar \
#       unzip \
#       wget && \
#     yum clean all && rm -rf /var/cache/yum/*



# # RUN vagrant init hashicorp/precise64  && 

# ADD Vagrantfile .

# # && /etc/init.d/vboxdrv setup

# RUN /sbin/rcvboxdrv setup && VBoxManage --version

# RUN cat  /var/log/vbox-install.log

# # RUN vagrant up






# #####################

# # # https://github.com/tdeheurles/vbox-vagrant
# FROM      ubuntu:15.04

# MAINTAINER Marco Zocca (ocramz)



ENV VAGRANT_VER 1.8.1



# RUN       apt-get update                                                                                                 && \
# echo "Install cURL"                                                                                                      && \
#           apt-get install curl wget -y                                                                                       

RUN echo "Prepare downloads"                                                         RUN mkdir -p /downloads                                                              
WORKDIR /downloads                                                            


                                    
# # RUN echo "download VirtualBox"                                                                                               && \
# #           curl -L http://download.virtualbox.org/virtualbox/5.0.2/virtualbox-5.0_5.0.2-102096~Ubuntu~trusty_amd64.deb -O && \
# #           mv virtualbox-5.0_5.0.2-102096~Ubuntu~trusty_amd64.deb $vbox_pathfi /downloads/virtualbox.deb    
          





RUN echo "download Vagrant"         && \                                             
wget -q --no-check-certificate https://releases.hashicorp.com/vagrant/${VAGRANT_VER}/vagrant_${VAGRANT_VER}_x86_64.deb -O /downloads/vagrant.deb




# # # ############ Virtualbox configuration ##############
# # RUN echo "Install VirtualBox dependencies & VirtualBox"  
# # # RUN apt-get purge virtualbox dkms linux-headers-$(uname -r) 
# # RUN apt-get install -y dkms linux-headers-$(uname -r) linux-image-$(uname -r)
# # # RUN echo y | apt-get install linux-image-3.19.0-26-generic linux-headers-3.19.0-26-generic -y 
# # RUN apt-get install -y libssl1.0.0 grub                                      
# # # apt-get install -y libvpx1 libsdl1.2debian libqtgui4 libqtcore4 libqt4-opengl libqt4-network  libpython2.7 libgl1 libgl1-mesa-glx libcurl3 libxcursor1 libxinerama1 libxmu6 psmisc
# # # RUN dpkg -i /downloads/virtualbox.deb     
# # RUN echo "Virtualbox 4.3 installation, as suggested in http://askubuntu.com/a/245874"
# # RUN apt-get install debian-keyring 
# # RUN wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -
# # RUN echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list.d/vbox.list
# # RUN apt-get update && apt-get -y upgrade
# # RUN apt-get remove virtualbox*
# # RUN apt-get install -y virtualbox-4.3 
# # RUN dpkg-reconfigure virtualbox-4.3
# # RUN /etc/init.d/vboxdrv setup 
# # RUN cat /var/log/vbox-install.log
# # RUN VBoxManage --version


RUN echo "Install Vagrant"                                                                                                 && \
          dpkg -i /downloads/vagrant.deb                                                                                 && \
  echo "Install Git"                                                                                                     && \
          apt-get install -y git                                                                                         && \
  echo "Clean apt-get"                                                                                                   && \
          apt-get autoremove                                                                                             && \
  echo "Remove download files"                                                                                           && \
          rm -rf /downloads         

# # RUN vagrant init hashicorp/precise64  && \

# RUN vagrant up --provider=docker


ADD Vagrantfile Vagrantfile

RUN VBoxManage --version

# RUN vagrant up





# # # ==== NOT WORKING =====

# # # ALPINE
# # FROM gliderlabs/alpine:3.3
# # RUN apk add --no-cache curl dpkg wget unzip tar bash 

# # # DEBIAN
# FROM debian:7.7
# # RUN apt-get -qq install -y --no-install-recommends ca-certificates debian-keyring debian-archive-keyring
# RUN apt-get update
# RUN apt-get install -y --no-install-recommends wget

# # # env variables
# ENV VAGRANT_VER 1.8.1

# # directory paths
# ENV DPKG_DIR /var/lib/dpkg

# # # mkdir
# RUN mkdir -p ${DPKG_DIR}


# # # VirtualBox
# RUN apt-get install -y virtualbox virtualbox-ose-dkms linux-headers-3.2.0-4-all
# # RUN apt-get install -y linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') virtualbox
# # RUN apt-cache search linux-headers 
# # linux-headers-$(uname -r)

# RUN dpkg-reconfigure virtualbox-dkms

# RUN dpkg-reconfigure virtualbox


# # # Vagrant
# RUN wget --no-check-certificate https://releases.hashicorp.com/vagrant/${VAGRANT_VER}/vagrant_${VAGRANT_VER}_x86_64.deb -O vagrant.deb

# RUN dpkg -i vagrant.deb
# RUN rm vagrant.deb

# ADD Vagrantfile Vagrantfile

# RUN VBoxManage --version

# RUN vagrant up