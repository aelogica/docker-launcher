# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

require 'yaml'
CONFIG = YAML.load_file("vagrant.yml")

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = CONFIG['private_key_path']
    override.vm.box = 'digital_ocean'
    override.vm.box_url = 'https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box'

    provider.client_id = CONFIG['client_id']
    provider.api_key = CONFIG['api_key']
    provider.region = CONFIG['region']
    provider.size = CONFIG['size']
    provider.image = CONFIG['name']
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end

end
