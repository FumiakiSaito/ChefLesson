#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
user "wwwadmin" do
  comment "wwwadmin"
  home "/home/wwwadmin"
  shell "/bin/bash"
  password nil
  supports :manage_home => true
  action [:create, :manage]
end
