Description
===========

Manage Mac OS X user defaults system.

Changes
=======

### v1.3.4:

* delete the *lockfile* not the *plist*

### v1.3.2:

* typo in `updated_by_last_action` - http://troll.me?p=32 :)

### v1.3.0:

* Issue 4 - action create should set `updated_by_last_action`
* Issue 5 - remove lockfile before updating plist

### v1.2.2:

* tweaks to userdefaults provider by Ben Bleything. Thanks Ben!
* ensure lion tweaks only runs on lion
* use strings not integers
* move mail tweaks to their own recipe
* add mail archive hotkey

### v1.2.0:

* add `plist_file` LWRP
* add recipes for managing various useful user defaults

Requirements
============

Platform
--------

Tested on Mac OS X 10.6.8, should work on any version.

Resource/Provider
=================

mac\_os\_x\_userdefaults
----

Manage the Mac OS X user defaults(1) system. The parameters to the resource are passed to the defaults command and the parameters follow convention of the OS X command. See the defaults(1) man page for detail on how the tool works.

### Actions

- :write: write the setting to the specified domain. Default.

### Attribute Parameters

- domain: The domain the defaults belong to. Required. Name attribute.
- global: Whether the domain is global. Can be true or false. Default false.
- key: The preference key. Required.
- value: The value of the key. Required.
- type: Value type of the preference key.
- sudo: Set to true if the setting requires privileged access to modify. Default false.

`value` settings of `1`, `TRUE` or `true` are treated as true by defaults(1), and are handled for truthiness in the provider.

### Limitations

The current version cannot handle plists or dictionaries.

### Examples

Simple example that uses the `com.apple.systempreferences` domain, with a single key and value.

    mac_os_x_userdefaults "enable time machine on unsupported volumes" do
      domain "com.apple.systempreferences"
      key "TMShowUnsupportedNetworkVolumes"
      value "1"
    end

Specify a global domain. Note that the key is not required for global domains.

    mac_os_x_userdefaults "full keyboard access to all controls" do
      domain "AppleKeyboardUIMode"
      global true
      value "2"
    end

A boolean type that uses truthiness (TRUE).

    mac_os_x_userdefaults "finder expanded save dialogs" do
      domain "NSNavPanelExpandedStateForSaveMode"
      global true
      value "TRUE"
      type "bool"
    end

A setting that uses an int (integer) type.

    mac_os_x_userdefaults "enable OS X firewall" do
      domain "/Library/Preferences/com.apple.alf"
      key "globalstate"
      value "1"
      type "int"
    end

LWRP's can send notifications, so we can change the Dock, and then refresh it to take effect.

    execute "killall Dock" do
      action :nothing
    end

    mac_os_x_userdefaults "set dock size" do
      domain "com.apple.dock"
      type "integer"
      key "tilesize"
      value "20"
      notifies :run, "execute[killall Dock]"
    end

This setting requires privileged access to modify, so tell it to use sudo. Note that this will prompt for the user password if sudo hasn't been modified for NOPASSWD.

    mac_os_x_userdefaults "disable time machine normal schedule" do
      domain "/System/Library/LaunchDaemons/com.apple.backupd-auto"
      key "Disabled"
      value "1"
      sudo true
    end

mac\_os\_x\_plist\_file
----

Manages the property list (plist) preferences file with the `cookbook_file` Chef resource. Files will be dropped in `Library/Preferences` under the home directory of the user running Chef.

### Actions

- :create: create the file. Default.

### Attribute Parameters

- source: file name to use in the files directory of the cookbook. Name attribute.
- cookbook: cookbook where the plist file is located.

### Examples

Write the iTerm 2 preferences to `~/Library/Preferences/com.googlecode.iterm2.plist`.

    mac_os_x_plist_file "com.googlecode.iterm2.plist"

Recipes
=======

The recipes in this cookbook provide example usage of the defaults(1) LWRP, and have some useful system preference settings. They were originally based on work done in Pivotal Labs workstation management repository, though are new code given the LWRP rewrite.

* https://github.com/pivotalexperimental/wschef

### dock\_preferences

Turns on:

* auto hide
* magnification

Turns off:

* animation switching workspaces

Sets the tile size to really small.

### finder

Sets Finder save dialogs to expanded by default.

### firewall

Enables the OS X firewall.

### kbaccess

Enables keyboard access to all window controls. In other words, "Tab" will cycle focus to buttons instead of just text entry fields.

### key\_repeat

Set the default key repeat rate to fast and the delay to short.

### screensaver

Enables password protection for screensaver and sets the delay to ask for password.

### time\_machine

Enable time machine to backup to unsupported devices like NAS drives or AFP shares.

License and Author
==================

Author:: Joshua Timberman (<cookbooks@housepub.org>)

Copyright 2011, Joshua Timberman

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
