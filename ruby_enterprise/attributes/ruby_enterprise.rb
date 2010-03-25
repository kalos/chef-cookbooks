#
# Cookbook Name:: ruby-enterprise
# attributes:: ruby_enterprise
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

default[:ruby_enterprise][:install_path] = "/usr/local"
default[:ruby_enterprise][:ruby_bin]     = "/usr/local/bin/ruby"
default[:ruby_enterprise][:gems_dir]     = "#{ruby_enterprise[:install_path]}/lib/ruby/gems/1.8"
default[:ruby_enterprise][:version]      = "1.8.7-2009.10_amd64"
default[:ruby_enterprise][:url]          = "http://rubyforge.org/frs/download.php/66163/ruby-enterprise_#{ruby_enterprise[:version]}.deb"
