# FROM debian:7.7
# FROM ubuntu:12.04
FROM fedora:23

MAINTAINER Marco Zocca <surname dot name gmail>

# # Fedora-based (dnf replaces yum for Fedora > 22)

RUN dnf install -y wget sudo

RUN wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo -O /etc/yum.repos.d/virtualbox.repo 

RUN ls -lsA /etc/yum.repos.d/



# RUN wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | rpm --import -

# RUN mkdir -p /downloads
# RUN wget -q http://download.virtualbox.org/virtualbox/5.0.16/VirtualBox-5.0-5.0.16_105871_fedora22-1.x86_64.rpm -O /downloads/virtualbox-fedora22.rpm
# WORKDIR /downloads
# RUN dnf install -y virtualbox-fedora22.rpm

RUN dnf install -y virtualbox

RUN sudo /usr/sbin/rcvboxdrv setup



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


