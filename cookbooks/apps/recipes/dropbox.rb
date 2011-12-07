#
# Cookbook Name:: apps
# Recipe:: dropbox
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

dmg_package 'Dropbox' do
  volumes_dir 'Dropbox Installer'
  source      'http://www.dropbox.com/download?plat=mac'
  checksum    '1f859cee4708b8db40558e43eb9f28fc2f272a71'
end
