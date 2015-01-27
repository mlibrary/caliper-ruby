require_relative "../../lib/caliper/request/http_requestor"
require_relative "../../lib/caliper/profiles/reading_profile"
require_relative "../../test/test_utils"
require "test/unit"


class HttpRequestorTest < Test::Unit::TestCase
	attr_accessor :http_requestor,
	              :id,
	              :timestamp,
	              :expected_content_type,
	              :learning_context,
	              :epub,
	              :from_resource,
	              :target,
	              :action,
	              :event

	def setup
		now = Time.now

		test_utils = TestUtils.new
		options =test_utils.get_testing_options
		@http_requestor = Caliper::Request::HttpRequestor.new options

		@id = "caliper-java_fccffd9b-68d5-4183-b563-e22136aafaa3"
		@timestamp = now
		@expected_content_type = "Content-Type: application/json"

		# build the learning context
		@learning_context = test_utils.build_readium_learning_context

		# Build epub
		@epub = test_utils.build_epub_volume_43

		# build previous location
		@from_resource = test_utils.build_am_rev_101_landing_page

		# build target
		@target = test_utils.build_epub_sub_chap_431

		# action
		@reading_profile = Caliper::Profiles::ReadingProfile.new

		#action = reading_profile.get_action_from_bundle(reading_profile.actions.

		p @learning_context.class

		@event = test_utils.build_epub_navigation_event @learning_context, @epub, @action, @fromResource, @target


	end

	def test_generate_payload_json()
		json_payload = @http_requestor.generate_payload @event, @id, @timestamp
		json_payload_fixture = JSON.parse(File.read(File.expand_path("..", Dir.pwd) + "/fixtures/event_store_payload.json")).to_json
		assert_equal("Test HTTP Requestor payload JSON",
		             json_payload_fixture, json_payload)
	end
end