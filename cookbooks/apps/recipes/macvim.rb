#
# Cookbook Name:: apps
# Recipe:: macvim
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
package "macvim"

git "#{ENV['HOME']}/.vim" do
  repository node.macvim.config_repo
  only_if { node.macvim.config_repo }
end

macvim_prefix = `brew --prefix macvim`.strip
link "/Applications/MacVim.app" do
  to "#{macvim_prefix}/MacVim.app"
end
