#
# Cookbook Name:: slimerjs
# Recipe:: default
#
# Copyright 2013, hanachin
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'

apt_repository 'multiverse' do
  uri        'http://archive.ubuntu.com/ubuntu'
  distribution 'precise'
  components %w(multiverse)
end

slimerjs_required_packages = %w(xvfb firefox dbus-x11 xserver-xorg-core xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic unzip ttf-mscorefonts-installer)
slimerjs_required_packages.each do |pkg|
  package pkg do
    action :install
  end
end

slimerjs_version  = '0.9.0rc1'
slimerjs_dirname  = 'slimerjs-0.9.0rc1'
slimerjs_filename = 'slimerjs-0.9.0rc1.zip'
slimerjs_base_url = 'http://download.slimerjs.org/v0.9/0.9.0rc1/'
slimerjs_checksum = 'd0c8ab594f63fcc5465d6c0b3448db06ba5d7286'
slimerjs_src_dir  = '/usr/local/src'

remote_file "#{slimerjs_src_dir}/#{slimerjs_filename}" do
  source "#{slimerjs_base_url}#{slimerjs_filename}"
  checksum slimerjs_checksum
  owner    'root'
  group    'root'
  mode     '0644'
  action   :touch
  not_if   { ::File.exists?('/usr/local/bin/slimerjs') && (matched = `/usr/local/bin/slimerjs --version`.match(/SlimerJS (\d+\.\d+\.\d+(?:rc\d+))/)) && matched[1] == slimerjs_version }
  notifies :run, 'execute[slimerjs-install]', :immediately
end

execute 'slimerjs-install' do
  command  "unzip #{slimerjs_src_dir}/#{slimerjs_filename} -d /usr/local"
  user     'root'
  group    'root'
  action   :nothing
  notifies :create, 'link[slimerjs-link]', :immediately
end

link 'slimerjs-link' do
  target_file   '/usr/local/bin/slimerjs'
  to            "/usr/local/#{slimerjs_dirname}/slimerjs"
  owner         'root'
  group         'root'
  action        :nothing
end
