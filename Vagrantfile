# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "box-cutter/ubuntu1404"

  config.vm.define "pop0" do |pop|
    pop.vm.hostname = "pop0"
    pop.vm.network "private_network", ip: "141.10.10.141"

    pop.vm.provider "virtualbox" do |vb|
      vb.cpus = 4
      vb.memory = "4096"
    end

  end

  config.vm.define "pop1" do |pop|
    pop.vm.hostname = "pop1"
    pop.vm.network "private_network", ip: "141.10.10.142"

    pop.vm.provider "virtualbox" do |vb|
      vb.cpus = 2
      vb.memory = "2048"
    end


  end

end
