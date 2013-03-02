#
# Cookbook Name:: rbenv
# Recipe:: rubies
#
# Copyright 2013, Ben Bleything <ben@bleything.net>
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

include_recipe 'rbenv::default'
include_recipe 'apps::gcc' # need to get an unbroken gcc

node.rubies.each do |ruby|
  execute "rbenv install #{ruby}" do
    environment "CC"  => "/usr/local/bin/gcc-4.2",
                "CXX" => "/usr/local/bin/g++-4.2"

    not_if { File.directory? "#{ENV['HOME']}/.rbenv/versions/#{ruby}" }
  end
end
