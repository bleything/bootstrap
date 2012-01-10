OSX Bootstrap
========================================================================

This is a little chef repo that I use for setting up a new mac. I'm
*very* lazy so most of the preferences are hardcoded in the
cookbooks. The result is that this sets up a machine the way I want,
which is quite possibly not how you want. I'll probably make it more
tunable later, but... lazy :D

Prerequisites
------------------------------------------------------------------------

You've got choices! If you want, you can try the [OSX GCC Installer],
but you won't be able to build anything that needs the Cocoa headers...
that means no MacVim or Cocoa Emacs.

Alternately, you can install XCode from the App Store... but then you'll
have the LLVM version of GCC and won't be able to build (for instance)
[Ruby Enterprise Edition].

To be safe, install both.

You'll also need to install chef.

[OSX GCC Installer]: https://github.com/kennethreitz/osx-gcc-installer/downloads
[Ruby Enterprise Edition]: http://www.rubyenterpriseedition.com

How Do?
------------------------------------------------------------------------

* check out the repo
* copy `config/example.json` to `config/whatever.json`
* edit your json file to taste
* `rake converge[whatever]`

Contributions and Thanks
------------------------------------------------------------------------

Contributions from:

* [Grégory Karékinian][gkarekinian]

The `vendored_cookbooks` directory contains cookbooks by:

* [Graeme Mathieson][mathie] ([homebrew])
* [Joshua Timberman][jtimberman] (1password, [dmg], [mac_os_x])

Those cookbooks are licensed under different terms; see their respective
READMEs for details.

[gkarekinian]: https://github.com/gkarekinian
[mathie]: https://github.com/mathie
[jtimberman]: https://github.com/jtimberman

[homebrew]: https://github.com/mathie/chef-homebrew
[dmg]: https://github.com/opscode/cookbooks/tree/master/dmg
[mac_os_x]: https://github.com/jtimberman/mac_os_x-cookbook

The Apache License, Version 2.0
------------------------------------------------------------------------

Copyright 2011-2012 Ben Bleything <ben@bleything.net>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
