#
# Cookbook Name:: heroku
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if platform?("ubuntu")
  package('wget') do
    action :install
  end
  execute('wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh')
end
