# -*- mode: ruby -*-

Vagrant.configure('2') do |config|
  config.vm.provision :ansible do |ansible|
    ansible.playbook = 'main.yml'
    ansible.host_key_checking = false
    ansible.extra_vars = { ansible_ssh_user: 'vagrant' }
  end


  config.vm.provider :virtualbox do |v|
    v.memory = 512
  end

  if Vagrant.has_plugin? 'vagrant-cachier'
    config.cache.enable :apt
    config.cache.scope = :box
  end

  config.vm.define 'buster', primary: true do |buster|
    buster.vm.box = 'debian/buster64'
  end
end
