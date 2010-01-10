#
# Cookbook Name:: nginx
# Recipe:: default
# Author:: Calogero Lo Leggio <kalos@nerdrug.org>
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

if node[:nginx][:passenger] == 'on'
  include_recipe "nginx::passenger"
else
  package "nginx" do
    action :upgrade
  end
end

service "nginx" do
  supports :status => true, :restart => true, :reload => true
end

directory node[:nginx][:log_dir] do
  mode 0755
  owner node[:nginx][:user]
  action :create
end

%w{nxensite nxdissite}.each do |nxscript|
  template "/usr/sbin/#{nxscript}" do
    source "#{nxscript}.erb"
    mode 0755
    owner "root"
    group "root"
  end
end

template "nginx.conf" do
  path "#{node[:nginx][:dir]}/nginx.conf"
  source "nginx.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "nginx")
end

template "#{node[:nginx][:dir]}/sites-available/default" do
  source "default-site.erb"
  owner node[:nginx][:user]
  group node[:nginx][:group]
  mode 0644
end

#remote_file "#{node[:nginx][:dir]}/mime.types" do
#  source "mime.types"
#  owner node[:nginx][:user]
#  group node[:nginx][:group]
#  mode 0644
#  notifies :restart, resources(:service => "nginx")
#end

if node[:nginx][:fcgi] == 'on' or node[:nginx][:passenger] == 'on'
  directory "#{node[:nginx][:dir]}/#{node[:nginx][:dir_extra_conf]}" do
    mode 0755
    owner node[:nginx][:user]
    group node[:nginx][:group]
    action :create
  end
  if node[:nginx][:fcgi] == 'on'
    template "#{node[:nginx][:dir]}/#{node[:nginx][:dir_extra_conf]}/fastcgi_params.conf" do
      source "conf.d/fastcgi_params.conf.erb"
      owner node[:nginx][:user]
      group node[:nginx][:group]
      mode 0644
      notifies :restart, resources(:service => "nginx")
    end
    template "#{node[:nginx][:dir]}/sites-available/TEMPLATE.fcgi" do
      source "TEMPLATE.fcgi.erb"
      owner node[:nginx][:user]
      group node[:nginx][:group]
      mode 0644
    end
  end
  if node[:nginx][:passenger] == 'on'
    remote_file "#{node[:nginx][:dir]}/#{node[:nginx][:dir_extra_conf]}/passenger.conf" do
      source "conf.d/passenger.conf"
      owner node[:nginx][:user]
      group node[:nginx][:group]
      mode 0644
      notifies :restart, resources(:service => "nginx")
    end
    template "#{node[:nginx][:dir]}/sites-available/TEMPLATE.passenger" do
      source "TEMPLATE.passenger.erb"
      owner node[:nginx][:user]
      group node[:nginx][:group]
      mode 0644
    end
  end
end

service "nginx" do
  action [ :enable, :start ]
end

remote_directory "#{node[:nginx][:dir]}/ssl" do
  source "ssl"
  files_backup 0
  files_mode 0600
end

directory "#{node[:nginx][:www_path]}/#{node[:nginx][:webapps_path]}" do
  recursive true
  owner node[:nginx][:user]
  group node[:nginx][:group]
  mode "0755"
end
