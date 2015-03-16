require 'simplecov'
require 'simplecov-rcov'
require 'require_all'
require_all 'lib/caliper/*.rb'

SimpleCov.use_merging
SimpleCov.merge_timeout(10000)
SimpleCov.command_name('open_data_export_gem')
SimpleCov.start('test_frameworks') do
  SimpleCov.coverage_dir('./coverage')
  SimpleCov.at_exit {
    SimpleCov.result
  }
end


RSpec.configure do |config|
  # ## Mock Framework
  config.mock_with :mocha

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end

