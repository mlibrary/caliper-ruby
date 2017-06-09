##
# This file is part of IMS Caliper Analytics™ and is licensed to
# IMS Global Learning Consortium, Inc. (http://www.imsglobal.org)
# under one or more contributor license agreements.  See the NOTICE
# file distributed with this work for additional information.
#
# IMS Caliper is free software: you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# IMS Caliper is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License along
# with this program. If not, see http://www.gnu.org/licenses/.

require 'json_spec'
require 'pp'
require 'simplecov'
require 'simplecov-rcov'

require_relative '../lib/caliper'
require 'shared_examples'

# Do not exclude 'id' keys from comparison.
JsonSpec.excluded_keys = []

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
  config.order = 'random'
end
