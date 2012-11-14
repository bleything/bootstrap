#!/usr/bin/env ruby
$stdout.sync = true

##### ================================================================================
puts "Bootstrap!"
puts "=" * 80
puts # blank line
puts "In just a few seconds, we're going to start setting up your machine. You should"
puts "be aware that this is an invasive, destructive operation. It is *strongly*"
puts "recommended that this script only be run on a brand new machine."
puts # blank line
puts "If you'd like to change your mind, now's your chance. Hit Ctrl-C to quit, or"
print "press enter to continue..."
$stdin.gets

puts # blank line
puts "Excellent! The first step is to enable passwordless sudo. In order to do that,"
print "you'll need to enter your password once. So, please enter your "
system "sudo sed -i.bak -E 's/^(%admin.*) ALL/\\1 NOPASSWD: ALL/' /etc/sudoers"

puts # blank line
puts "Great! Now we're going to set up a few more things..."
puts # blank line

system "sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer"
puts "  * set Xcode path"

system "sudo mkdir -p /usr/local"
puts "  * created /usr/local"

system "sudo chown -R #{ENV['USER']} /usr/local"
puts "  * fixed permissions on /usr/local"

puts # blank line
puts "Next, we need to create you an ssh key. You'll be prompted for a passphrase."
puts "Please use a secure passphrase that you don't use elsewhere. Do not create a"
puts "passphrase-less key."
puts # blank line

system "ssh-keygen -q -f ~/.ssh/id_rsa"

puts # blank line
puts "Great! Here's your public key:"
puts # blank line
puts "---"
system "cat ~/.ssh/id_dsa.pub"
puts "---"
puts # blank line

puts "Okay, now we're ready to run the real setup. This is your last chance to change"
print "your mind. Ctrl-C to quit, enter to continue..."
$stdin.gets

puts # blank line
puts "Awesome! This is going to take a while, so feel free to wander off and get some"
puts "coffee. We'll be done soon enough."
system "rake converge[dna]"

