require 'yaml'

settings = YAML.load_file 'settings.yml'

Vagrant.configure('2') do |config|
  config.vm.box = 'dummy'
  config.vm.box_url = 'https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box'

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '1024']
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

  config.vm.define :local do |local|
    local.vm.box     = 'pricise64'
    local.vm.box_url = 'http://files.vagrantup.com/precise64.box'
    local.vm.network :private_network, ip: "192.168.33.10"
    local.vm.synced_folder '~/work', '/vagrant_data'
  end

  config.vm.define :remote do |remote|
  end

  # vagrant plugin install vagrant-omnibus
  config.omnibus.chef_version = '11.6.0'

  # vagrant plugin install vagrant-berkshelf
  config.berkshelf.enabled = true

  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "./cookbooks"
  #   chef.roles_path     = "./roles"
  #   chef.data_bags_path = "./data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role   "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end
end
