
# choose how many machines the cluster will contain
N_VMS = 3

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/precise64"
  # use a minimal amount of RAM for each node to avoid overwhelming the host
  config.vm.provider "virtualbox" do |v|
    v.memory = 256
    v.cpus = 1
  end
  config.vm.network "private_network", type: "dhcp"
  
  hosts_file = []
  1.upto(N_VMS) do |i|
    config.vm.define vm_name = "node#{i}" do |config|
      config.vm.hostname = vm_name
      ip = "192.168.0.#{100+i}"
      config.vm.network "private_network",
        ip: ip,
        virtualbox__intnet: "clusternet"
    end
  end

  script = <<-SCRIPT
    set -x
    if [[ ! -e /etc/.provisioned ]]; then
      rm /etc/hosts
      for i in {1..N_VMS}; do
        ip="192.168.0.$((100+i))"
        echo "$ip node$i" >> /etc/hosts
      done
      # we only generate the key on one of the nodes
      if [[ ! -e /vagrant/id_rsa ]]; then
        ssh-keygen -t rsa -f /vagrant/id_rsa -N ""
      fi
      install -m 600 -o vagrant -g vagrant /vagrant/id_rsa /home/vagrant/.ssh/
      cat /vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
      apt-get -y update
      apt-get -y install openmpi1.5-bin libopenmpi1.5-dev
      touch /etc/.provisioned
    fi
  SCRIPT
  script.sub! 'N_VMS', N_VMS.to_s
  config.vm.provision "shell", inline: script


  # config.vm.provision "shell", inline: "echo Hello"

  # config.vm.define "web" do |web|
  #   web.vm.box = "apache"
  # end

  # config.vm.define "db" do |db|
  #   db.vm.box = "mysql"
  # end

  # config.vm.provision :docker
  # config.vm.provision :docker_compose, yml: "/vagrant/docker-compose.yml", rebuild: true, run: "always"
end