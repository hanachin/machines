#
# Cookbook Name:: dev
# Recipe:: default
#
# Copyright 2013, hanachin
#
# All rights reserved - Do Not Redistribute
#
ssh_known_hosts_entry 'github.com'
include_recipe 'dev::emacs'
include_recipe 'dev::git-viewers'
include_recipe 'dev::source-reading'
