# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "bento/ubuntu-18.04"

  config.vm.define "pop0" do |pop|
    pop.vm.hostname = "pop0"
    pop.vm.network "private_network", ip: "141.10.10.141"

    pop.vm.provider "virtualbox" do |vb|
      vb.cpus = 4
      vb.memory = "8192"
    end

  end


end
