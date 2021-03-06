#
# Cookbook Name:: roundcube
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

webapp_install "roundcube" do
  url "http://downloads.sourceforge.net/project/roundcubemail/roundcubemail/@VERS@/roundcubemail-@VERS@.tar.gz"
  compression "tar.gz"
  template ["config/db.inc.php", "config/main.inc.php"]
end
