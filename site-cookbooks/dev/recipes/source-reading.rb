apt_repository 'silversearcher-ag' do
  uri 'http://ppa.launchpad.net/mizuno-as/silversearcher-ag/ubuntu'
  distribution 'raring'
  components %w(main)
  keyserver 'keyserver.ubuntu.com'
  key 'D1E5D3D2'
end

# # silversearcher dependencies
# package 'liblzma5' do
#   action :install
# end

# source_reading_packages = %w(silversearcher-ag)
source_reading_packages = []

source_reading_packages.each do |pkg|
  package pkg do
    action :install
  end
end
