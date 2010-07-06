#
# Cookbook Name:: sphinx99
# Recipe:: default
#
execute "add-sphinx-version-to-emerge-list" do
  command %Q{
    emerge --sync
    echo "=app-misc/sphinx-0.9.9" >> /etc/portage/package.keywords/ec2
  }
  not_if "cat /etc/portage/package.keywords/ec2 | grep app-misc/sphinx-0.9.9"
end

package "app-misc/sphinx" do
  version "0.9.9"
  action :install
end