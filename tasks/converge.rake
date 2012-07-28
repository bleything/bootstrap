desc "Runs chef-solo with the given config/<dna>.json"
task :converge, :dna do |t, args|
  config_dir = File.expand_path(File.dirname(__FILE__) + '/..') + "/config"
  fail "config/#{args[:dna]}.json does not exist" unless File.exists?( config_dir + "/#{args[:dna]}.json" )
  sh "chef-solo -c #{config_dir}/solo.rb -j #{config_dir}/#{args[:dna]}.json"
end
