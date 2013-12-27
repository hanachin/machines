secret  = Chef::EncryptedDataBagItem.load_secret File.expand_path "~/chef-solo/data_bag_key"
develop = Chef::EncryptedDataBagItem.load('repositories', 'develop', secret)

develop['repositories'].each do |location, c|
  git location do
    repository c['repository']
    revision   c['revision']
    action     :sync
    user       c['user']
    group      c['group']
  end
end

