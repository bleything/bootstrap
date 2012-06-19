name "homebrew"
description "homebrew setup"

run_list %w{
  recipe[homebrew]
  recipe[homebrew::environment]
  recipe[homebrew::taps]
  recipe[homebrew::packages]
}
