name "homebrew"
description "homebrew setup"

run_list %w{
  recipe[homebrew::usr_local]
  recipe[homebrew]
  recipe[homebrew::environment]
  recipe[homebrew::taps]
  recipe[homebrew::packages]
}
