#
# Cookbook Name:: apps
# Recipe:: grandperspective
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

dmg_package 'GrandPerspective' do
  volumes_dir 'GrandPerspective 1.3.3'
  source      'http://downloads.sourceforge.net/project/grandperspectiv/grandperspective/1.3.3/GrandPerspective-1_3_3.dmg?r=http%3A%2F%2Fgrandperspectiv.sourceforge.net%2F&ts=1329150167&use_mirror=cdnetworks-us-2'
  checksum    '099d4d42c1482778fab6ea96186e538e0be7d6cc'
end
