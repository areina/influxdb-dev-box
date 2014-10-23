# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "docker" do |v|
    v.cmd       = ["/usr/sbin/sshd", "-D"]
    v.build_dir = "."
    v.has_ssh = true
  end

  config.ssh.username = "vagrant"
  config.vm.synced_folder "gocodez", "/home/vagrant/gocodez"
end
