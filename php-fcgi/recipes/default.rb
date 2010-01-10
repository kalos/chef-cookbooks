#
# Author:: Calogero Lo Leggio (<kalos@nerdrug.org>)
# Cookbook Name:: php-fcgi
# Recipe:: default
#
# Copyright 2009, Calogero Lo Leggio
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package "php5-cgi" do
  action :upgrade
end

include_recipe "php-fcgi::pear"
#include_recipe "php-fcgi::module_apc"
include_recipe "php-fcgi::module_curl"
include_recipe "php-fcgi::module_fileinfo"
include_recipe "php-fcgi::module_gd"
include_recipe "php-fcgi::module_imap"
include_recipe "php-fcgi::module_mail"
include_recipe "php-fcgi::module_mcrypt"
include_recipe "php-fcgi::module_mdb2"
#include_recipe "php-fcgi::module_mhash"
include_recipe "php-fcgi::module_mysql"
include_recipe "php-fcgi::module_socket"
include_recipe "php-fcgi::module_sqlite"
include_recipe "php-fcgi::module_mdb2_sqlite"
#include_recipe "php-fcgi::module_xcache"

service "php-cgi" do
  supports :restart => true, :reload => true
end

remote_file "/etc/php5/cgi/php.ini" do
  source "php.ini"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "php-cgi")
end

template "/etc/init.d/php-cgi" do
  source "php-cgi.erb"
  mode 0755
  notifies :restart, resources(:service => "php-cgi")
  backup 0
end

service "php-cgi" do
  action [ :enable, :start ]
end
