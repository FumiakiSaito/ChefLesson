#
# Cookbook Name:: mysqld
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
log "mysqld start!!"

# install mysql-server
package 'mysql-server' do
    action :install
end

 # service mysqld start
 # chkconfig mysqld on
 service "mysqld" do
     action [:enable, :start]
end