#
# Cookbook Name:: mysql
# Definition:: db_install
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

define :db_install, :chef_query => "*", :user => "root", :pass => nil,
       :db_server => nil, :file_user => "root", :file_group => "root" do

  ch_query = node[:webapps][params[:name].to_sym][:chef_query]
  params[:chef_query] = ch_query unless ch_query.nil?

  if params[:db_server].nil? and params[:pass].nil?
    name_and_pass = []
    search(:node, params[:chef_query]) do |server|
      name_and_pass << "#{server['fqdn']} #{server['mysql']['server_root_password']}"
    end
    tmp = []
    puts name_and_pass.inspect
    name_and_pass.each { |p| tmp << p unless p.split(" ")[1].nil? }
    params[:db_server], params[:pass] = tmp.first.split(" ")
    puts params[:db_server]
    puts params[:pass]
  end

  Gem.clear_paths # needed for Chef to find the gem...
  require 'mysql' # requires the mysql gem

  # TODO - SQL con erb ?!
  unless params[:template].empty?
    params[:template].each do |t|
      template t do
        source    File.basename(t) + ".erb"
        owner     params[:file_user]
        group     params[:file_group]
        mode      0644
        variables :db_name => params[:name]
        # notifies  :run, resources(:execute => "exec_sql"), :immediately
      end

      execute "exec_sql for #{File.basename(t)}" do
        command "mysql -u root -p#{params[:pass]} -h #{params[:db_server]} < #{t}"
        not_if do
          db = Mysql.new(params[:db_server], params[:user], params[:pass])
          db.list_dbs.include?(params[:name])
        end
        # action :nothing
      end
    end
  end

end
