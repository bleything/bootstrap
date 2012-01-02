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

The MIT License
------------------------------------------------------------------------

Copyright (c) 2011 Ben Bleything <ben@bleything.net>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
