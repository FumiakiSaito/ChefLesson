#
# Cookbook Name:: mysqld
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

yum_repository 'epel' do
  description 'Extra Packages for Enterprise Linux'
  mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch'
  fastestmirror_enabled true
  gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
  action :create
end
# add the Remi repo
yum_repository 'remi' do
  description 'Les RPM de Remi - Repository'
  baseurl 'http://rpms.famillecollet.com/enterprise/6/remi/x86_64/'
  gpgkey 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
  fastestmirror_enabled true
  action :create
end

%w[perl-DBD-MySQL perl-DBI].each do |pkg|
 
  package pkg do
    action :install
  end
end

# install mysql from remi repo
%w[mysql mysql-server phpMyAdmin].each do |pkg|
  package pkg do
    action :install
    options "--enablerepo=remi"
  end
end

# service mysqld start
# chkconfig mysqld on
 service "mysqld" do
     action [:enable, :start]
end


# /etc/httpd/conf.d/phpMyAdmin.conf
template "phpMyAdmin.conf" do
   path "/etc/httpd/conf.d/phpMyAdmin.conf"
   source "phpMyAdmin.conf.erb"
 end
 
 # /etc/phpMyAdmin/config.inc.php
template "config.inc.php" do
   path "/etc/phpMyAdmin/config.inc.php"
   source "config.inc.php.erb"
 end
 
 # create directories for mysql log files.
mysql_log_dir = '/var/log/mysql'
 
directory mysql_log_dir do
  owner "mysql"
  group "mysql"
  mode "0755"
  action :create
end
 
# touch log files
%w[ 
  error
  slow
  query
].each do |log_name|
  bash "create_#{log_name}_log" do
    log_file = "#{mysql_log_dir}/#{log_name}.log"
    code <<-EOC
      touch #{log_file}
    EOC
    creates log_file
  end
end

