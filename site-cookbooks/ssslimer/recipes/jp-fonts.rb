%w(fonts-takao).each do |pkg|
  package pkg do
    action :install
  end
end
