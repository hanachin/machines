#
# Cookbook Name:: slimerjs
# Recipe:: default
#
# Copyright 2013, hanachin
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'

slimerjs_required_packages = %w(xvfb firefox dbus-x11 xserver-xorg-core xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic unzip)
slimerjs_required_packages.each do |pkg|
  package pkg do
    action :install
  end
end

slimerjs_version  = '0.8.2'
slimerjs_dirname  = 'slimerjs-0.8.2'
slimerjs_filename = 'slimerjs-0.8.2.zip'
slimerjs_base_url = 'http://download.slimerjs.org/v0.8/'
slimerjs_checksum = '18066ada8e3735f1a2722b104f13201c57136375'
slimerjs_src_dir  = '/usr/local/src'

remote_file "#{slimerjs_src_dir}/#{slimerjs_filename}" do
  source "#{slimerjs_base_url}#{slimerjs_filename}"
  checksum slimerjs_checksum
  owner    'root'
  group    'root'
  mode     '0644'
  action   :touch
  not_if   { ::File.exists?('/usr/local/bin/slimerjs') && `/usr/local/bin/slimerjs --version`.match(/SlimerJS (\d+\.\d+\.\d+)/)[1] == slimerjs_version }
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
