#
# Cookbook Name:: config
# Library:: hotkey_group
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

class HotkeyGroup
  @functions = {}

  def self.toggle_hotkey( key, state )
    unless [:enabled, :disabled].include?( state )
      raise ArgumentError, "state must be :enabled or :disabled"
    end

    unless @functions.keys.include?(key)
      raise ArgumentError, "unknown hotkey #{key}"
    end

    puts "setting #{key} to #{state}"
  end

  def self.method_missing( m, *args )
    case args.first
    when Symbol
      toggle_hotkey m, args.first
    end
  end
end
