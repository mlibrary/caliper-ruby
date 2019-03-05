source 'https://rubygems.org'

# Declare your gem's dependencies in open_data_export.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.

# require_all utility
gem 'require_all'

# the Concurrent::Atomic lib
gem 'concurrent-ruby'

# translation and localization
gem 'i18n'

# UUID generation
gem 'uuid'

# REST client
gem 'rest-client', '~> 1.7.3'

group :development do
  # irb is not bundled with ruby 2.6+, so add for development convenience
  gem 'irb', require: false
end

group :development, :test do
  gem 'test-unit'
  gem 'simplecov', :require => false, :group => :test
  gem 'simplecov-rcov', :require => false, :group => :test
  gem 'mocha', '~> 1.1.0'
  gem 'json_spec'
end
