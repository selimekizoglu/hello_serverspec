# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  CONSUL_CLUSTER_IP = "192.168.50.1"
  HAPROXY_IP = "192.168.50.2"
  config.vm.define "haproxy" do |haproxy|
    haproxy.vm.box = "ubuntu/trusty64"
    haproxy.vm.network "private_network", ip: HAPROXY_IP
    haproxy.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/haproxy.yml"
      ansible.extra_vars = {
        consul_servers: [CONSUL_CLUSTER_IP]
      }
    end
  end
  config.vm.define "goservice" do |goservice|
    goservice.vm.box = "ubuntu/trusty64"
    goservice.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/goservice.yml"
      ansible.extra_vars = {
        dmz_domain: 'istanbulcoders',
        haproxy_ip: HAPROXY_IP,
        consul_servers: [CONSUL_CLUSTER_IP]
      }
    end
  end
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
