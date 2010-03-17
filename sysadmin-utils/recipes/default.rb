#
# Cookbook Name:: sysadmin-utils
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


# base
if node[:sysadmin_utils][:modules].include?('base')
  package "psmisc"
  package "htop"
end

# apt-dater
if node[:sysadmin_utils][:modules].include?('apt-dater')
  package "apt-dater-host" do
    options "--force-yes"
  end
end

# zsh
if node[:sysadmin_utils][:modules].include?('zsh')
  package "zsh"

  remote_directory "/etc/zsh" do
    source "zsh"
    files_owner "root"
    files_group "root"
    files_backup 3
  end

  if node[:sysadmin_utils][:zsh_def]
    node[:sysadmin_utils][:zsh_users].each do |u|
      user u do
        action :modify
        shell "/bin/zsh"
      end
    end
  end
end
