#
# Cookbook Name:: config
# Recipe:: dock
#
# Copyright 2011, Ben Bleything <ben@bleything.net>
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

settings = {
  "FXPreferredViewStyle"            => "Nlsv", # list view
  "NewWindowTarget"                 => "PfHm", # home directory
  "RemoveIDiskFromSidebarOnStartup" => true,
  "ShowExternalHardDrivesOnDesktop" => true,
  "ShowHardDrivesOnDesktop"         => false,
  "ShowMountedServersOnDesktop"     => true,
  "ShowRemovableMediaOnDesktop"     => true,
  "ShowStatusBar"                   => true,
}

settings.each do |k,v|
  mac_os_x_userdefaults k do
    domain "com.apple.finder"
    key    k
    value  v
  end
end

execute "killall Finder"
