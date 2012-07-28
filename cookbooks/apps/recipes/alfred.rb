#
# Cookbook Name:: apps
# Recipe:: alfred
#
# Copyright 2011, Ben Bleything <ben@bleything.net>
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

include_recipe 'dmg'
include_recipe 'mac_os_x'

mac_os_x_plist_file 'com.alfredapp.Alfred.plist' do
  not_if { File.exists?("#{ENV['HOME']}/Library/Preferences/#{name}") }
end

if node.alfred.attribute?('sync_folder')
  mac_os_x_userdefaults 'alfred.sync.folder' do
    domain 'com.alfredapp.Alfred.plist'
    key name
    value node.alfred.sync_folder
  end
end

directory "#{ENV['HOME']}/Library/Application Support/Alfred"
template "#{ENV['HOME']}/Library/Application Support/Alfred/license.plist" do
  action :create_if_missing
  source "alfred-license.plist.erb"
end

dmg_package 'Alfred' do
  volumes_dir 'Alfred.app'
  source      'http://cachefly.alfredapp.com/alfred_1.3_249.dmg'
  checksum    '9be8cdb4d4072d635070023cef910467db96fb18'
end
