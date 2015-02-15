#!/usr/bin/env rake

require 'foodcritic'
require 'rake/clean'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

begin
  require 'emeril/rake'
rescue LoadError
  puts 'It appears that Emeril is not installed.' unless ENV['CI']
end

CLEAN.include %w(.kitchen/ .yardoc/ coverage/)
CLOBBER.include %w(doc/ Berksfile.lock Gemfile.lock)

# Default tasks to run when executing `rake`
task default: %w(style spec)

# Style tests. Rubocop and Foodcritic
namespace :style do
  desc 'Run Ruby style checks'
  RuboCop::RakeTask.new(:ruby)

  desc 'Run Chef style checks'
  FoodCritic::Rake::LintTask.new(:chef) do |t|
    t.options = { fail_tags: ['any'] }
  end
end

desc 'Run all style checks'
task style: ['style:chef', 'style:ruby']

# Rspec and ChefSpec
desc 'Run ChefSpec examples'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.verbose = false
end
