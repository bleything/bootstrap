#
# Cookbook Name:: apps
# Recipe:: vlc
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

dmg_package 'VLC' do
  volumes_dir 'vlc-1.1.12'
  source      'http://downloads.sourceforge.net/project/vlc/1.1.12/macosx/vlc-1.1.12-intel64.dmg?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fvlc%2Ffiles%2F1.1.12%2Fmacosx%2Fvlc-1.1.12-intel64.dmg%2Fdownload&ts=1328112000&use_mirror=superb-dca2'
  checksum    '3a1877677113e50301b8046d1a1eca8b1ac6c747'
end
