
# # https://github.com/tdeheurles/vbox-vagrant
FROM      ubuntu:15.04

MAINTAINER Marco Zocca (ocramz)

ENV VAGRANT_VER 1.8.1

RUN       apt-get update                                                                                                 && \
echo "Install cURL"                                                                                                      && \
          apt-get install curl wget -y                                                                                        && \
echo "Prepare downloads"                                                                                                 && \
          mkdir /downloads                                                                                               && \
          cd /downloads                                                              

                                    
# RUN echo "download VirtualBox"                                                                                               && \
#           curl -L http://download.virtualbox.org/virtualbox/5.0.2/virtualbox-5.0_5.0.2-102096~Ubuntu~trusty_amd64.deb -O && \
#           mv virtualbox-5.0_5.0.2-102096~Ubuntu~trusty_amd64.deb $vbox_pathfi /downloads/virtualbox.deb    
          





RUN echo "download Vagrant"         && \                                                                                           
# RUN curl -L https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.4_x86_64.deb -O                                   && \
#           mv vagrant_1.7.4_x86_64.deb $vbox_pathfi /downloads/vagrant.deb    

wget --no-check-certificate https://releases.hashicorp.com/vagrant/${VAGRANT_VER}/vagrant_${VAGRANT_VER}_x86_64.deb -O /downloads/vagrant.deb




# ############ Virtualbox configuration ##############

RUN echo "Install VirtualBox dependencies & VirtualBox"  

# RUN apt-get purge virtualbox dkms linux-headers-$(uname -r) && \ 
# apt-get install -y dkms linux-headers-$(uname -r) 

# RUN apt-get install -y virtualbox-4.2
# RUN dpkg-reconfigure virtualbox-dkms  && modprobe vboxdrv
                                            
                                                                                     # RUN echo y | apt-get install linux-image-3.19.0-26-generic linux-headers-3.19.0-26-generic -y 


RUN apt-get install -y libssl1.0.0
                                                   
          # apt-get install -y libvpx1                                                                                     && \
          # apt-get install -y libsdl1.2debian                                                                             && \
          # apt-get install -y libqtgui4                                                                                   && \
          # apt-get install -y libqtcore4                                                                                  && \
          # apt-get install -y libqt4-opengl                                                                               && \
          # apt-get install -y libqt4-network                                                                              && \
          # apt-get install -y libpython2.7                                                                                && \
          # apt-get install -y libgl1                                                                                      && \
          # apt-get install -y libgl1-mesa-glx                                                                             && \
          # apt-get install -y libcurl3                                                                                    && \
          # apt-get install -y libxcursor1                                                                                 && \
          # apt-get install -y libxinerama1                                                                                && \
          # apt-get install -y libxmu6                                                                                     && \
          # apt-get install -y psmisc
          


# RUN dpkg -i /downloads/virtualbox.deb     

# RUN /etc/init.d/vboxdrv setup                



RUN echo "Virtualbox 4.3 installation, suggested in http://askubuntu.com/a/245874"

RUN apt-get install debian-keyring 
RUN wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -

# gpg --keyserver pgp.mit.edu --recv-keys 1F41B907 && \
# gpg --armor --export 1F41B907 | apt-key add -


RUN echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list.d/vbox.list

RUN apt-get update && sudo apt-get -y upgrade

RUN apt-get remove virtualbox*

RUN apt-get install -y virtualbox-4.3






RUN  echo "Install Vagrant"                                                                                                 && \
          dpkg -i /downloads/vagrant.deb                                                                                 && \
  echo "Install Git"                                                                                                     && \
          apt-get install -y git                                                                                         && \
  echo "Clean apt-get"                                                                                                   && \
          apt-get autoremove                                                                                             && \
  echo "Remove download files"                                                                                           && \
          rm -rf /downloads         && \

vagrant init hashicorp/precise64 && vagrant up 








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