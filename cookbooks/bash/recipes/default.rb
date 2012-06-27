#
# Cookbook Name:: bash
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

directory "#{ENV['HOME']}/.bash.d"
cookbook_file "#{ENV['HOME']}/.bash.d/README"
cookbook_file "#{ENV['HOME']}/.bash.d/path"

cookbook_file "#{ENV['HOME']}/.bash_profile" do
  source "dot-bash_profile"
end

cookbook_file "#{ENV['HOME']}/.bashrc" do
  source "dot-bashrc"
end
