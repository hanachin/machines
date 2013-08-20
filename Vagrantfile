Vagrant.configure('2') do |config|
  config.vm.box = 'dummy'
  config.vm.box_url = 'https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box'

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end

  config.vm.define :local do |local|
    local.vm.box     = 'pricise64'
    local.vm.box_url = 'http://files.vagrantup.com/precise64.box'
    local.vm.network :private_network, ip: "192.168.33.10"
    local.vm.synced_folder '~/work', '/vagrant_data'
  end

  # vagrant plugin install vagrant-omnibus
  config.omnibus.chef_version = '11.6.0'

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
