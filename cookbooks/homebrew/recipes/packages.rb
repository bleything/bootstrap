#
# Cookbook Name:: homebrew
# Recipe:: packages
#
# Copyright 2011-2012, Ben Bleything <ben@bleything.net>
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
include_recipe 'homebrew::taps'

node.homebrew.packages.each do |pkg|
  case pkg
  when String
    package pkg
  when Hash
    cmd = [ "brew install", pkg['package'] ]

    cmd << '--HEAD' if pkg['head']
    cmd << pkg['args']

    cmd_string = cmd.compact.join(" ")
    execute(cmd_string) do
      not_if { ::File.directory?("/usr/local/Cellar/#{pkg['package']}") }
    end

    ### we have to unlink before we re-link :/
    if pkg['link']
      execute "brew unlink #{pkg['package']}"
      execute "brew link #{pkg['package']}"
    end
  end
end
