#
# Cookbook Name:: webapps
# Definition:: webapp_install
# Author:: Calogero Lo Leggio <kalos@nerdrug.org>
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

define :webapp_install, :user => "root", :url => nil, :compression => nil  do
  bash "install #{params[:name]}" do
    cwd "#{node[:webapps][:full_path]}"
    user params[:user]
    code <<-EOH
      wget #{params[:url].gsub!('@VERS@',node[:webapps][params[:name].to_sym][:version])} -O #{params[:name]}-#{node[:webapps][params[:name].to_sym][:version]}.#{params[:compression]}
      tar xf #{params[:name]}-#{node[:webapps][params[:name].to_sym][:version]}.#{params[:compression]}
      mv `tar tf #{params[:name]}-#{node[:webapps][params[:name].to_sym][:version]}.#{params[:compression]} | head -1 | tr -d '/'` #{params[:name]}-#{node[:webapps][params[:name].to_sym][:version]}
      chown -R #{node[:webapps][:user]}:#{node[:webapps][:group]} #{params[:name]}-#{node[:webapps][params[:name].to_sym][:version]}
      ln -sf #{params[:name]}-#{node[:webapps][params[:name].to_sym][:version]} #{params[:name]}
    EOH
    not_if "test -d #{node[:webapps][:full_path]}/#{params[:name]}-#{node[:webapps][params[:name].to_sym][:version]}"
  end

#  params[:template] = Array.new
  unless params[:template].empty?
    params[:template].each do |t|
      template "#{node[:webapps][:full_path]}/#{params[:name]}-#{node[:webapps][params[:name].to_sym][:version]}/#{t}" do
        source File.basename(t) + ".erb"
        owner node[:webapps][:user]
        group node[:webapps][:group]
        mode 0640
      end
    end
  end

end
