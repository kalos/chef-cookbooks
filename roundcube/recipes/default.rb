#
# Cookbook Name:: roundcube
# Recipe:: default
#
# Copyright 2010, Calogero Lo Leggio
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

#bash "install roudcube" do
#  cwd "#{node[:nginx][:www_path]}/#{node[:nginx][:webapps_path]}"
#  user "root"
#  code <<-EOH
#    wget http://downloads.sourceforge.net/project/roundcubemail/roundcubemail/#{node[:webapp][:roundcube][:version]}/roundcubemail-#{node[:webapp][:roundcube][:version]}.tar.gz
#    tar xf roundcubemail-#{node[:webapp][:roundcube][:version]}.tar.gz
#    chown -R #{node[:nginx][:user]}:#{node[:nginx][:user]} roundcubemail-#{node[:webapp][:roundcube][:version]}
#    ln -sf roundcubemail-#{node[:webapp][:roundcube][:version]} roundcube
#  EOH
#  not_if "test -d #{node[:nginx][:www_path]}/#{node[:nginx][:webapps_path]}/roundcubemail-#{node[:webapp][:roundcube][:version]}"
#end

install_src "roundcube" do
  url "http://downloads.sourceforge.net/project/roundcubemail/roundcubemail/@VERS@/roundcubemail-@VERS@.tar.gz"
  compression "tar.gz"
end

template "#{node[:nginx][:www_path]}/#{node[:nginx][:webapps_path]}/roundcubemail-#{node[:webapp][:roundcube][:version]}/config/db.inc.php" do
  source "db.inc.php.erb"
  owner node[:nginx][:user]
  group node[:nginx][:group]
  mode 0640
end

template "#{node[:nginx][:www_path]}/#{node[:nginx][:webapps_path]}/roundcubemail-#{node[:webapp][:roundcube][:version]}/config/main.inc.php" do
  source "main.inc.php.erb"
  owner node[:nginx][:user]
  group node[:nginx][:group]
  mode 0640
end
