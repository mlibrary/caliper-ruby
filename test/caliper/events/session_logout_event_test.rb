
require '../../../lib/caliper/entities/learning_context'
require '../../../lib/caliper/entities/software_application'
require '../../../lib/caliper/entities/reading/epub_sub_chapter'
require '../../../lib/caliper/entities/session'
require '../../../lib/caliper/event/event'

require_relative "../../../lib/caliper/request/http_requestor"
require_relative "../../../lib/caliper/profiles/session_profile"
require_relative "../../../lib/caliper/profiles/reading_profile"
require_relative "../test_utils"

require 'i18n'
require 'json'

class SessionLogoutEventTest < Test::Unit::TestCase
	include I18n::Tests
	include TestUtils

	attr_accessor :learning_context, # LearningContext
								:ed_app, # SoftwareApplication
								:key, # String
								:target, # EpubSubChapter
								:event # Event

	def setup

		p  File.expand_path("../../", Dir.pwd) + '/config/locales/en.yml'
		I18n.load_path = [[File.expand_path("../../..", Dir.pwd) + '/config/locales/en.yml']]
		I18n.locale = :en
		# I18n.t("actions.annotation.attached")

		# Build the Learning Context
		@learning_context = TestUtils.build_readium_learning_context

		# Action
		@ed_app = learning_context.ed_app

		# Action
		@key = Caliper::Profiles::SessionActions::LOGGED_OUT

		# build target
		@target = TestUtils.build_session_end

		# build event
		@event = TestUtils.build_epub_logout_event(@learning_context, @ed_app, @key, @target)

	end

	def test_caliper_event_serializes_to_json
		json_payload_fixture = JSON.parse(File.read(File.expand_path("../../", Dir.pwd) + "/fixtures/caliper_session_logout_event.json")).to_json
		assert_equal("Test if loggedIn event is serialized to JSON with expected values",
		             json_payload_fixture, @event.to_json)
	end
end