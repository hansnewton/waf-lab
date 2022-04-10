# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7"
  
  config.vm.synced_folder ".", "/vagrant", type: 'virtualbox'
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  config.vm.define 'vm' do |s|
    s.vm.hostname = "waf.hans.dev"
    s.vm.network "private_network", ip: "192.168.56.8", :netmask => "255.255.255.0"
    
    s.vm.provision "shell" do |shell| 
      shell.path = "provision.sh"
      shell.privileged = true
    end
  end
  
end
