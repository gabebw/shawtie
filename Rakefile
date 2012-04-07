require 'bundler/setup'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new

RSpec::Core::RakeTask.new(:acceptance) do |t|
  t.pattern = 'spec/acceptance/**/*.feature'
end

task :default => [:spec, :acceptance]
