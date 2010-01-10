#
# Cookbook Name:: webstats
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

package "awstats" do
  action :upgrade
end

package "visitors" do
  action :upgrade
end

remote_file "/etc/awstats/BASE" do
  source "BASE"
  mode 0644
end

directory node[:webstats][:path_pages] do
  owner node[:webapps][:user]
  group node[:webapps][:group]
  mode "0755"
  recursive true
end

if node[:webstats][:nginx_tmpl] == 'on'
  template "#{node[:nginx][:dir]}/sites-available/TEMPLATE.stats" do
    source "TEMPLATE.stats.erb"
    owner node[:nginx][:user]
    group node[:nginx][:group]
    mode 0644
  end
end

template File.join(node[:webstats][:path_pages], '..', 'stats.rb') do
  source "stats.rb.erb"
  mode 0755
end

template File.join(node[:webstats][:path_pages], '..', 'noha_stats.sh') do
  source "noha_stats.sh.erb"
  mode 0755
end

template "/var/spool/fcron/#{node[:webapps][:user]}.orig" do
  source "fcrontab.orig.erb"
  mode 0644
end

execute "add_stats_fcrontab" do
  command "fcrontab -u #{node[:webapps][:user]} -z"
  only_if "test ! -f /var/spool/fcron/#{node[:webapps][:user]}"
end
#cron "ruby stats" do
#  minute "1"
#  hour   "5"
#  command "ruby #{node[:web_stats][:path_pages]}/stats.rb > /dev/null 2>&1"
#end
#cron "noha stats" do
#  minute "45"
#  hour   "23"
#  command "[ `date -d tomorrow +%d` -eq '01' ] && #{node[:web_stats][:path_pages]}/noha_stats.sh"
#end
