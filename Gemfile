source 'https://rubygems.org'

group :development do
  gem 'emeril', '~> 0.8.0'
  gem 'guard', '~> 2.12'
  gem 'guard-kitchen'
  gem 'guard-foodcritic'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'rake'
end

group :style do
  gem 'foodcritic', '~> 4.0'
  gem 'rubocop',    '~> 0.32.1'
end

group :unit do
  gem 'berkshelf', '~> 3.2'
  gem 'chefspec',  '~> 4.2.0'
  gem 'coveralls', '~> 0.8.2', require: false
end

group :kitchen_cloud do
  gem 'kitchen-digitalocean'
  gem 'kitchen-ec2'
  gem 'kitchen-gce'
  gem 'kitchen-joyent'
end

group :kitchen_common do
  gem 'test-kitchen', '~> 1.4'
end

group :kitchen_docker do
  gem 'kitchen-docker', '~> 2.1.0'
end

group :kitchen_vagrant do
  gem 'kitchen-vagrant', '~> 0.18.0'
end
