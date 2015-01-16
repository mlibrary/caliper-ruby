require "test/unit"
require_relative "../lib/caliper/entities/DigitalResource"

class TestBase < Test::Unit::TestCase

	def test_base
		r = Caliper::Entities::DigitalResource.new(1)
		p r.id
		p r.object_type
		assert_equal(1, r.id, "digital resource id equals 1")
	end

end