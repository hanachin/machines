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
   revision   's3upload'
   action     :sync
   user       'root'
   group      'root'
end
