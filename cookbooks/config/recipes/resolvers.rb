#
# Cookbook Name:: config
# Recipe:: resolvers
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

# use execute instead of directory so we can inline sudo
execute "sudo mkdir -p /etc/resolver"
execute "sudo chgrp -R admin /etc/resolver"
execute "sudo chmod -R g+w /etc/resolver"

node.resolvers.each do |domain, servers|
  file "/etc/resolver/#{domain}" do
    content servers.map {|s| "nameserver #{s}" }.join("\n") + "\n"
  end
end
