#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
yum_repository 'remi-php55' do
    description 'Les RPM de remi de PHP 5.5 pour Enterprise Linux 6'
    baseurl 'http://rpms.famillecollet.com/enterprise/6/php55/$basearch/'
    gpgkey 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
    fastestmirror_enabled true
    action :create
end

# install php
%w[php php-cli php-common php-gd php-intl php-mbstring php-mcrypt  php-pecl-apc php-process php-snmp php-xml php-xmlrpc php-pecl-memcache php-pecl-memcached php-fpm php-opcache].each do |pkg|
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
 
