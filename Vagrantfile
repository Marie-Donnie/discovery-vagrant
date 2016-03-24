# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubutu14.04-x64"
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 4
    vb.memory = "5000"
  end

  config.vm.network "private_network", ip: "141.10.10.141"

end
