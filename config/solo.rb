current_dir = File.expand_path(File.dirname(__FILE__))

file_cache_path  "#{current_dir}/../.chef/cache"
file_backup_path "#{current_dir}/../.chef/backup"
cache_options(   :path => "#{current_dir}/../.chef/checksums", :skip_expires => true )

role_path "#{current_dir}/../roles"
cookbook_path [
  "#{current_dir}/../cookbooks",
  "#{current_dir}/../vendored_cookbooks"
]

Ohai::Config[:disabled_plugins] = %w(java)
