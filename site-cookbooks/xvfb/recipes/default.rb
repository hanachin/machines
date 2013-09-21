%w(xvfb dbus-x11 xserver-xorg-core xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic).each do |pkg|
  package pkg do
    action :install
  end
end

template '/etc/init.d/xvfb' do
  source 'xvfb.erb'
  mode   '0755'
  owner  'root'
  group  'root'
  variables bin_path: node['xvfb']['bin_path'], pid_path: node['xvfb']['pid_path'], args: node['xvfb']['args']
end

execute 'update-rc.d xvfb defaults'
execute 'service xvfb start' do
  not_if "[ -f #{node['xvfb']['pid_path']} ]"
end
