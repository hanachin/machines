template '/etc/nginx/conf.d/ssslimer.conf' do
  source 'ssslimer.conf.erb'
  mode   '0644'
  owner  'root'
  group  'root'
  notifies :reload, 'service[nginx]'
end
