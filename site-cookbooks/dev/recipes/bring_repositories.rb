secret = Chef::EncryptedDataBagItem.load_secret "/tmp/encrypted_data_bag_secret"
works  = Chef::EncryptedDataBagItem.load('repositories', 'works', secret)

works['repositories'].each do |location, c|
  git location do
    repository c['repository']
    revision   c['revision']
    action     :sync
    user       c['user']
    group      c['group']
  end
end
