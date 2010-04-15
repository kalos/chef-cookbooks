#
# Cookbook Name:: apt
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

execute "apt-get update" do
  action :nothing
end

template "/etc/apt/apt.conf" do
  source "apt.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

template "/etc/apt/preferences" do
  source "preferences.erb"
  owner "root"
  group "root"
  mode 0644
end

remote_file "/etc/apt/apt.conf.d/70debconf" do
  source "70debconf"
  owner "root"
  group "root"
  mode 0644
end

if node[:apt][:proxy_url] != ""
  template "/etc/apt/apt.conf.d/01proxy" do
    source "01proxy.erb"
    owner "root"
    group "root"
    mode 0644
  end
end

template "/etc/apt/sources.list" do
  source "sources.list.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :run, resources(:execute => "apt-get update"), :immediately
end

if node[:apt][:unattended_upgrades] == true
  package "unattended-upgrades" do
    action :upgrade
  end

  remote_file "/etc/apt/apt.conf.d/02periodic" do
    source "02periodic"
    owner "root"
    group "root"
    mode 0644
  end
end

node[:apt][:extra_sources].each do |source|
  template "/etc/apt/sources.list.d/#{source}.list" do
    source "sources_#{source}.list.erb"
    owner "root"
    group "root"
    mode 0644
    notifies :run, resources(:execute => "apt-get update"), :immediately
  end

  if source == "backports"
    package "debian-backports-keyring" do
      options "--force-yes"
    end
  end
end
