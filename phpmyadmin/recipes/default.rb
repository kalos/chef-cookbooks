#
# Cookbook Name:: phpmyadmin
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

bash "install phpmyadmin" do
  cwd "#{node[:nginx][:www_path]}/#{node[:nginx][:webapps_path]}"
  user "root"
  code <<-EOH
    wget http://downloads.sourceforge.net/project/phpmyadmin/phpMyAdmin/#{node[:phpmyadmin][:version]}/phpMyAdmin-#{node[:phpmyadmin][:version]}-all-languages.tar.bz2
    tar xf phpMyAdmin-#{node[:phpmyadmin][:version]}-all-languages.tar.bz2
    ln -sf phpMyAdmin-#{node[:phpmyadmin][:version]}-all-languages phpmyadmin
  EOH
  not_if "test -d #{node[:nginx][:www_path]}/#{node[:nginx][:webapps_path]}/phpMyAdmin-#{node[:phpmyadmin][:version]}-all-languages"
end



template "#{node[:nginx][:www_path]}/#{node[:nginx][:webapps_path]}/phpMyAdmin-#{node[:phpmyadmin][:version]}-all-languages/config.inc.php" do
  source "config.inc.php.erb"
  owner node[:nginx][:user]
  group node[:nginx][:group]
  mode 0640
end
