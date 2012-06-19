name "dev"
description "dev workstation setup"

run_list %w{
  role[homebrew]

  recipe[apps::gcc]
  recipe[apps::emacs]
  recipe[apps::macvim]
  recipe[apps::virtualbox]
}

default_attributes(
  "homebrew" => {
    "packages" => %w[
      ack
      autoconf
      automake
      dos2unix
      git
      gnupg
      hub
      md5sha1sum
      pstree
      tmux
      tree
    ]
  }
)
