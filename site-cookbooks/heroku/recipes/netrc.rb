secret  = Chef::EncryptedDataBagItem.load_secret "/tmp/encrypted_data_bag_secret"
heroku = Chef::EncryptedDataBagItem.load('passwords', 'heroku', secret)

template '/home/vagrant/.netrc' do
  source 'netrc.erb'
  mode   '0600'
  owner  'vagrant'
  group  'vagrant'
  variables email: heroku['email'], password: heroku['password']
  not_if { File.exists?('/home/vagrant/.netrc') }
end
