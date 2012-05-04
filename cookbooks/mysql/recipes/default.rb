#
# Cookbook Name:: mysql
# Recipe:: default
# Author:: Ben Bleything <ben.bleything@livingsocial.com>
#
# Copyright 2012, LivingSocial
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

include_recipe 'homebrew'

cookbook_file "#{ENV['HOME']}/.my.cnf" do
  source "dot-my.cnf"
end

package "mysql"

execute "mysql_install_db" do
  not_if { File.directory? node.mysql.datadir + "/mysql" }

  command [
    "/usr/local/bin/mysql_install_db",
    "--verbose",
    "--user=`whoami`",
    '--basedir="$(brew --prefix mysql)"',
    "--datadir=#{node.mysql.datadir}",
    "--tmpdir=/tmp"
  ].join(' ')
end

directory "#{ENV['HOME']}/Library/LaunchAgents"

execute "copy launchagent config" do
  command 'cp $(brew --prefix mysql)/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents'
end

execute "load launchdaemon" do
  command "launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
  not_if "launchctl list | grep mysql"
end
