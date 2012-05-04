#
# Cookbook Name:: apps
# Recipe:: sublime_text
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

include_recipe 'dmg'

dmg_package 'Sublime Text 2' do
  source node.sublime_text.url
  checksum node.sublime_text.checksum
  dmg_name 'sublime_text_2'
end

directory "#{ENV['HOME']}/Library/Application Support/Sublime Text 2/Settings" do
  recursive true
end

file "#{ENV['HOME']}/Library/Application Support/Sublime Text 2/Settings/License.sublime_license" do
  content node.sublime_text.license
  only_if { node.sublime_text.license }
end
