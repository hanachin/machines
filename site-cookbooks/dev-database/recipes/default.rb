#
# Cookbook Name:: dev-database
# Recipe:: default
#
# Copyright 2013, hanachin
#
# All rights reserved - Do Not Redistribute
#



ENV['LANGUAGE'] = ENV['LANG'] = ENV['LC_ALL'] = "en_US.UTF-8"
include_recipe "postgresql::server"
