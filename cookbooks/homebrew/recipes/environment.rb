#
# Cookbook Name:: homebrew
# Recipe:: environment
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

directory("/usr/local/etc/bash_completion.d") { recursive true }
link "/usr/local/etc/bash_completion.d/homebrew" do
  to "/usr/local/Library/Contributions/brew_bash_completion.sh"
end

directory "#{ENV['HOME']}/.bash.d"
cookbook_file "#{ENV['HOME']}/.bash.d/homebrew"
