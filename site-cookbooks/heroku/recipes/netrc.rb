secret  = Chef::EncryptedDataBagItem.load_secret File.expand_path "~/chef-solo/data_bag_key"
heroku = Chef::EncryptedDataBagItem.load('passwords', 'heroku', secret)

template '/home/vagrant/.netrc' do
  source 'netrc.erb'
  mode   '0600'
  owner  'vagrant'
  group  'vagrant'
  variables email: heroku['email'], password: heroku['password']
  not_if { File.exists?('/home/vagrant/.netrc') }
end
