#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# install httpd
# install httpd-devel
# install mod_ssl
%w[httpd httpd-devel mod_ssl].each do |pkg|
    package pkg  do
        action :install
    end
end

# service httpd start
# chkconfig httpd on
service "httpd" do
    action [:enable, :start]
 end
 
# /etc/httpd/conf/httpd.conf
template "httpd.conf" do
   path "/etc/httpd/conf/httpd.conf"
   source "httpd.conf.erb"
   notifies :restart, "service[httpd]"
 end
 
# /etc/httpd/conf.d/vhosts.conf
template "vhosts.conf" do
   path "/etc/httpd/conf.d/vhosts.conf"
   source "vhosts.conf.erb"
   notifies :restart, "service[httpd]"
 end
 
 # fuel_template DocumentRoot
 directory "/var/www/applications/fuel_template" do
  owner "vagrant"
  group "vagrant"
  recursive true
  mode 0755
  action :create
end

 # codeignitertest DocumentRoot
 directory "/var/www/applications/codeignitertest" do
  owner "vagrant"
  group "vagrant"
  recursive true
  mode 0755
  action :create
end