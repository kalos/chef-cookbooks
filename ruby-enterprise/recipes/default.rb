#
# Cookbook Name:: ruby-enterprise
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

script "download_and_install_rubyee" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH 
  wget "http://rubyforge.org/frs/download.php/66163/ruby-enterprise_1.8.7-2009.10_amd64.deb" -O rubyee.deb
  dpkg -i rubyee.deb
  rm -f rubyee.deb
  EOH
  not_if "dpkg -l ruby-enterprise | grep ii"
end
