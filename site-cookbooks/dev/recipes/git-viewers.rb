git_viewer_packages = %w(lv tig)

git_viewer_packages.each do |pkg|
  package pkg do
    action :install
  end
end
