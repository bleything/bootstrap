#
# Cookbook Name:: apps
# Recipe:: virtualbox
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

include_recipe 'dmg'

dmg_package 'VirtualBox' do
  volumes_dir 'VirtualBox'
  source      'http://download.virtualbox.org/virtualbox/4.1.10/VirtualBox-4.1.10-76795-OSX.dmg'
  checksum    '8e4947db292dd64f32afe56d6022245898e719f1'
  type        'mpkg'
end
