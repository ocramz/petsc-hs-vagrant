# FROM debian:7.7
# FROM ubuntu:12.04
FROM fedora:23

MAINTAINER Marco Zocca <surname dot name gmail>

# # Fedora-based (dnf replaces yum for Fedora > 22)

RUN dnf install wget curl sudo


# # # tools

# RUN apt-get update
# RUN apt-get install -y wget curl 

# RUN apt-get install -y sudo


# RUN apt-cache search linux-headers 

# RUN sudo apt-get install -y linux-headers-3.19.0-30-generic 
# # linux-headers-3.2.0-4-all # linux-image-3.2.0-4-amd64

# RUN sudo apt-get install -y dkms virtualbox-dkms # debconf-get-selections debconf-utils

# RUN ls -lsA /lib/modules


# # # following the procedure at https://www.virtualbox.org/wiki/Linux_Downloads

# RUN sudo echo "deb http://download.virtualbox.org/virtualbox/debian wheezy contrib" >> /etc/apt/sources.list

# # RUN echo "deb http://download.virtualbox.org/virtualbox/debian wheezy-backports main" >> /etc/apt/sources.list

# RUN wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

# RUN sudo apt-get update
# RUN sudo apt-get install -y virtualbox-5.0

# RUN sudo /sbin/rcvboxdrv setup








# ENV VAGRANT_VER 1.8.1

# RUN echo "Prepare downloads"                                                         RUN mkdir -p /downloads                                                              
# WORKDIR /downloads                                                            


# RUN echo "download Vagrant"         && \                                             
# wget -q --no-check-certificate https://releases.hashicorp.com/vagrant/${VAGRANT_VER}/vagrant_${VAGRANT_VER}_x86_64.deb -O /downloads/vagrant.deb

# RUN echo "Install Vagrant" && dpkg -i /downloads/vagrant.deb  



# RUN echo "Install Git" && apt-get install -y git 


# # # cleanup actions
# RUN echo "Clean apt-get" && apt-get autoremove -y
# RUN echo "Remove download files" && rm -rf /downloads         

# # # RUN vagrant init hashicorp/precise64  && \

# # RUN vagrant up --provider=docker


# ADD Vagrantfile Vagrantfile

# RUN VBoxManage --version

# # RUN vagrant up




# RUN dpkg-reconfigure virtualbox-dkms

# RUN dpkg-reconfigure virtualbox


