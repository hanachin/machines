#
# Cookbook Name:: ssslimer
# Recipe:: default
#
# Copyright 2013, hanachin
#
# All rights reserved - Do Not Redistribute
#
git '/usr/local/ssslimer' do
   repository 'https://github.com/hanachin/ssslimer.git'
   revision   'master'
   action     :sync
   user       'root'
   group      'root'
end

template '/etc/init.d/ssslimer' do
  source 'ssslimer.erb'
  mode   '0755'
  owner  'root'
  group  'root'
  variables pid_path: node['ssslimer']['pid_path'], user: node['ssslimer']['user'], group: node['ssslimer']['group'], display: node['ssslimer']['display']
end

execute 'update-rc.d ssslimer defaults'
execute 'service ssslimer start' do
  not_if "[ -f #{node['ssslimer']['pid_path']} ]"
end
