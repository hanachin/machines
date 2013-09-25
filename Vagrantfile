require 'yaml'

settings = YAML.load_file 'settings.yml'

Vagrant.configure('2') do |config|
  config.vm.box = 'dummy'
  config.vm.box_url = 'https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box'

  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end

  # vagrant plugin install vagrant-digitalocean
  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = settings['digital_ocean']['machines']['defaults']['private_key_path']
    override.ssh.username         = settings['digital_ocean']['machines']['defaults']['username']

    override.vm.box = 'digital_ocean'
    override.vm.box_url = 'https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box'

    provider.client_id = settings['digital_ocean']['client_id']
    provider.api_key   = settings['digital_ocean']['api_key']
    provider.image     = settings['digital_ocean']['machines']['defaults']['image']
    provider.region    = settings['digital_ocean']['machines']['defaults']['region']
    provider.size      = settings['digital_ocean']['machines']['defaults']['size']
  end

  # vagrant plugin install vagrant-aws
  config.vm.provider :aws do |aws, override|
    aws.access_key_id     = settings['aws']['access_key_id']
    aws.secret_access_key = settings['aws']['secret_access_key']
    aws.keypair_name      = settings['aws']['machines']['defaults']['keypair']
    aws.region            = settings['aws']['machines']['defaults']['region']
    aws.ami               = settings['aws']['machines']['defaults']['ami']
    aws.instance_type     = settings['aws']['machines']['defaults']['instance_type']

    override.ssh.username         = settings['aws']['machines']['defaults']['username']
    override.ssh.private_key_path = settings['aws']['machines']['defaults']['private_key_path']
  end

  config.vm.define :develop do |develop|
    develop.vm.box     = 'pricise64'
    develop.vm.box_url = 'http://files.vagrantup.com/precise64.box'
    develop.vm.network :private_network, ip: "192.168.33.10"
    develop.vm.network :forwarded_port, guest: 3000, host: 33000
    develop.vm.network :forwarded_port, guest: 80,   host: 30080
    develop.vm.network :forwarded_port, guest: 8080, host: 38080
    develop.vm.synced_folder '~/work', '/vagrant_data'
    develop.vm.provision :chef_solo do |chef|
      chef.roles_path = "roles"
      chef.data_bags_path = "data_bags"
      chef.add_role 'develop'
    end
  end

  config.vm.define :worker do |worker|
    worker.vm.provider :digital_ocean do |provider, override|
      provider.region = 'New York 1'
    end

    worker.vm.provision :chef_solo do |chef|
      chef.roles_path = "roles"
      chef.data_bags_path = "data_bags"
      chef.add_role 'worker'
    end
  end

  # vagrant plugin install vagrant-omnibus
  config.omnibus.chef_version = '11.6.0'

  # vagrant plugin install vagrant-berkshelf
  config.berkshelf.enabled = true
end
