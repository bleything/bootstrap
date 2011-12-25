name 'osx'
description 'osx recipes'

run_list %w(
  recipe[apps::1password]
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

default_attributes(
  "one_password" => {
    "version" => "3.8.12",
    "checksum" => "9e7ad33a876ce9a5d1a63438d95619ca0e3240af"
  }
)
