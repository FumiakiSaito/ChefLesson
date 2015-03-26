#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# install php
%w[php php-cli php-common php-gd php-intl php-mbstring php-mcrypt  php-pecl-apc php-process php-snmp php-xml php-xmlrpc php-pecl-memcache php-pecl-memcached].each do |pkg|
    package pkg do
        action :install
    end
end

# /etc/php.ini
template "php.ini" do
   path "/etc/php.ini"
   source "php.ini.erb"
   notifies :restart, "service[httpd]"
 end
 
