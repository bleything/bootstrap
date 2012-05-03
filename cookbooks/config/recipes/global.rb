#
# Cookbook Name:: config
# Recipe:: global
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
  # expand file and print dialogs
  "NSNavPanelExpandedStateForSaveMode" => true,
  "PMPrintingExpandedStateForPrint"    => true,

  # look and feel
  "AppleAquaColorVariant" => 6,
  "AppleHighlightColor"   => "1.000000 0.823500 0.505900"
}

settings.each do |k,v|
  mac_os_x_userdefaults k do
    domain 'NSGlobalDomain'
    global true
    key    k
    value  v
  end
end
