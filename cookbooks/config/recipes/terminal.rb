#
# Cookbook Name:: config
# Recipe:: terminal
#
# The theme installed by this recipe is based on Tomorrow Night by Chris
# Kempson. The original is available at https://github.com/chriskempson/tomorrow-theme
#
# Copyright 2012, Ben Bleything <ben@bleything.net>
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

pb = '/usr/libexec/PlistBuddy -c'
key = ':Window\ Settings:Tomorrow\ Night\ (bootstrap)'
plist = "#{ENV['HOME']}/Library/Preferences/com.apple.Terminal.plist"

execute "#{pb} 'Add #{key} dict' #{plist}" do
  not_if "#{pb} 'Print #{key}' #{plist}"
end

execute "add theme" do
  file = File.expand_path("../../files/default/bootstrap.terminal", __FILE__)

  command "#{pb} 'Merge #{file} #{key}' #{plist}"
  not_if "#{pb} 'Print #{key}:name' #{plist}"
end

%w(Startup Default).each do |section|
  k = "#{section} Window Settings"
  mac_os_x_userdefaults k do
    domain "com.apple.Terminal"
    key k
    value "Tomorrow Night (bootstrap)"
  end
end
