#
# Cookbook Name:: apps
# Recipe:: adium
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

mac_os_x_plist_file 'com.adiumX.adiumX.plist' do
  p "#{ENV['HOME']}/Library/Preferences/#{name}"
  not_if Proc.new { File.exists?("#{ENV['HOME']}/Library/Preferences/#{name}") }
end

dmg_package 'Adium' do
  volumes_dir 'Adium 1.4.4'
  source      'http://download.adium.im/Adium_1.4.4.dmg'
  checksum    '7ef5dd8e764560856f99634f55a23887'
end
