# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'erb'

CLUSTER_SIZE = ENV['CLUSTER_SIZE']

Vagrant.configure("2") do |config|


  config.vm.provider 'virtualbox' do |vbox|
    vbox.customize ['modifyvm', :id, '--memory', 1024]
    vbox.customize ['modifyvm', :id, '--cpus', 1]
  end

  config.vm.box = "ubuntu/trusty64"

  (1..CLUSTER_SIZE).each do |index|
    ip = "192.168.99.#{index+10}"
    primary = index == 1
    node_name = "es-vm-#{index}"

    config.vm.define :"#{node_name}", primary: primary do |node|
      node.vm.hostname = "#{node_name}.es.dev"
      node.vm.network 'private_network', ip: ip, auto_config: true
      node.vm.provision 'shell', path: 'bootstrap.sh'
    end
  end
end
