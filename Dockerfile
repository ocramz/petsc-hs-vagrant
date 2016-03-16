FROM fedora:23

MAINTAINER Marco Zocca <surname dot name gmail>

# # Fedora-based (dnf replaces yum for Fedora > 22)

RUN dnf install -y wget sudo

RUN wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo -O /etc/yum.repos.d/virtualbox.repo 

# RUN ls -lsA /etc/yum.repos.d/

RUN sudo dnf -y upgrade

RUN dnf install -y binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel dkms


# RUN wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | rpm --import -

# # # download, install virtualbox
RUN mkdir -p /downloads
RUN wget -q http://download.virtualbox.org/virtualbox/5.0.16/VirtualBox-5.0-5.0.16_105871_fedora22-1.x86_64.rpm -O /downloads/virtualbox-fedora22.rpm
WORKDIR /downloads
RUN dnf install -y virtualbox-fedora22.rpm

# ##### RUN sudo /usr/sbin/rcvboxdrv setup

# "functions.sh" bug
RUN find / -name functions
# # " make a symlink for the time being
RUN ln -s /etd/init.d/functions /sbin/functions.sh 

RUN /usr/lib/virtualbox/vboxdrv.sh setup


# RUN cat /usr/lib/virtualbox/vboxdrv.sh


# "KERN_DIR" env var, just in case it's needed
ENV KERN_DIR /usr/src/kernels/`uname -r`

 
 

# # # install Vagrant
RUN dnf install -y vagrant




# # # RUN vagrant init hashicorp/precise64  && \

# # RUN vagrant up --provider=docker


# ADD Vagrantfile Vagrantfile

# RUN VBoxManage --version

# # RUN vagrant up






