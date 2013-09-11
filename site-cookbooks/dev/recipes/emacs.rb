# original: ChefでUbuntu 12.04にemacs 24.3をインストールする - スコトプリゴニエフスク通信 http://perezvon.hatenablog.com/entry/2013/08/15/012016
apt_repository "cassou-emacs" do
  uri "http://ppa.launchpad.net/cassou/emacs/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "CEC45805"
end

%w{emacs24-nox}.each do |pkg|
  package pkg do
    action :install
  end
end

