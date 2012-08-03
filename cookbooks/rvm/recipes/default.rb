#
# Cookbook Name:: rvm
# Recipe:: default
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

remote_file "/tmp/rvm-installer" do
  source "http://get.rvm.io"
  not_if { ::File.file? "#{ENV['HOME']}/.rvm/bin/rvm" }
end

execute "rvm-installer" do
  command "bash -s master < /tmp/rvm-installer"
  not_if { ::File.file? "#{ENV['HOME']}/.rvm/bin/rvm" }
end

file "#{ENV['HOME']}/.rvm/gemsets/global.gems" do
  content "bundler\n"
end

directory "#{ENV['HOME']}/.bash.d"
cookbook_file "#{ENV['HOME']}/.bash.d/rvm"
