file "/etc/sudoers.d/root_ssh_agent" do
  mode 0440
  owner 'root'
  group 'root'
  content %(Defaults\tenv_keep += "SSH_AUTH_SOCK"\n)
  not_if { File.exists? '/etc/sudoers.d/root_ssh_agent' }
end

