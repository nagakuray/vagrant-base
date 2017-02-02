# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "sample01" do |base|
    base.vm.box = "centos72"
    # Memory setting
    base.vm.provider "virtualbox" do |vm|
      vm.customize ["modifyvm", :id, "--memory", "2048"]
    end
    # IP address setting
    base.vm.network "private_network", ip: "192.168.33.11"
    # Hostname setting
    base.vm.hostname = "sample01"
    # Provisioning with super user
    base.vm.provision :shell do |shell|
      shell.path = "./setup.sh"
      shell.privileged = true
    end
  end

end
