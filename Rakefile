require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

desc 'serve the webhooks app using rerun and foreman'
task :serve do
  sh 'rerun foreman start'
end

task :default => :serve
