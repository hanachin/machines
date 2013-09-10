#
# Cookbook Name:: dev-users
# Recipe:: default
#
# Copyright 2013, hanachin
#
# All rights reserved - Do Not Redistribute
#

vagrant = data_bag_item('users', 'vagrant')

user vagrant['name'] do
  shell vagrant['shell']
end
