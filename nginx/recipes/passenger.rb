#
# Cookbook Name:: nginx
# Recipe:: passenger
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

include_recipe "ruby-enterprise"

execute "apt-key-add" do
  command "wget -q -O - http://apt.brightbox.net/release.asc | apt-key add -"
  only_if "test `apt-key list | grep -c support@brightbox.co.uk` -eq 0"
end

execute "apt-get update" do
  action :nothing
end

remote_file "/etc/apt/sources.list.d/passenger.list" do
  source "sources_passenger.list"
  owner "root"
  group "root"
  mode 0644
  notifies :run, resources(:execute => "apt-get update"), :immediately
end

# TODO - no  specific version
package "librack-ruby1.8" do
  version "1.0.1-1"
end

package "passanger-common" do
  action :upgrade
end

package "nginx-brightbox" do
  options "--force-yes"
end
