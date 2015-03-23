source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['>= 3.5.1', '<=3.7.2']

group :rspec, :kitchen do
  gem 'librarian-puppet', '2.0.0'
  gem 'puppet', puppetversion
  gem 'rspec_junit_formatter'
  gem 'puppet-blacksmith'
end

group :rspec do
  gem 'puppetlabs_spec_helper', '>= 0.1.0'
  gem 'puppet-lint', '< 1.1.0'
  gem 'facter', '>= 1.7.0'
  gem 'rspec-puppet', :git => 'https://github.com/rodjek/rspec-puppet.git'
  gem 'puppet-syntax'
end

group :kitchen do
  gem 'puppet_forge', '<= 1.0.2'
  gem 'test-kitchen'
  gem 'kitchen-puppet'
  gem 'kitchen-docker'
  gem 'kitchen-vagrant'
  gem 'vagrant-wrapper'
end
