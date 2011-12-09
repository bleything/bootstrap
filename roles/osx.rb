name 'osx'
description 'osx recipes'

run_list %w(
  recipe[apps::alfred]
  recipe[apps::chrome]
  recipe[apps::dropbox]

  recipe[config::dock]
  recipe[config::finder]
  recipe[config::global]
  recipe[config::hostname]
  recipe[config::screensaver]

  recipe[homebrew]
  recipe[homebrew::packages]
)

default_attributes(
  "homebrew" => {
    "packages" => %w[
      ack
      git
      macvim
      par
      unison
    ]
  }
)
