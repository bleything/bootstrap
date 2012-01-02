#
# Cookbook Name:: apps
# Recipe:: 1password
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

include_recipe "1password::default"

backup_path = File.expand_path("~/Dropbox/Backups/1Password")
directory(backup_path) { action :create ; recursive true }

keychain_path = File.expand_path( "~/Dropbox/1Password.agilekeychain" )

settings = {
  "AgileKeychainLocation"         => keychain_path,
  "keychainBackupFolderPath"      => backup_path,
  "AGUpdateAllowBetas"            => true,
  "AGInstallBrowserExtensions"    => true,
  "AGAskedAboutBrowserExtensions" => false,
  "keychainRotationFrequency"     => 10,
  "License"                       => {
    "Person" => node['one_password'].name,
    "Serial" => node['one_password'].key
  }
}

settings.each do |k,v|
  mac_os_x_userdefaults k do
    domain "ws.agile.1Password"
    key    k
    value  v
  end
end
