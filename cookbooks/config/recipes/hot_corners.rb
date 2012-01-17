#
# Cookbook Name:: config
# Recipe:: hot_corners
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

# Corner action magic numbers:
#
#    0: no action
#    2: mission control
#    3: application windows
#    4: desktop
#    5: start screen saver
#    6: disable screen saver
#    7: dashboard
#   10: display sleep
#   11: launchpad
#
corners = {
  :tl => 6, # disable screen saver
  :bl => 5, # start screen saver
  :tr => 0, # no action
  :br => 0, # no action
}

corners.each do |corner, v|
  mac_os_x_userdefaults "#{corner}: #{v}" do
    domain "com.apple.dock"
    key    "wvous-#{corner}-corner"
    value  v
  end
end

execute "killall Dock"
