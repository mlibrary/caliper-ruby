
require "../../lib/caliper/entities/learning_context"
require "../../lib/caliper/entities/software_application"
require "../../lib/caliper/entities/digital_resource"
require "../../lib/caliper/entities/reading/epub_sub_chapter"
require "../../lib/caliper/sensor"
require_relative "test_utils"
require "test/unit"

class TestEvent < Test::Unit::TestCase
	def test
		test_utils = TestUtils.new
		Caliper::Sensor.new(test_utils.test_options())

		# Build the Learning Context
		learningContext = TestUtils.buildReadiumLearningContext()

		# Build epub
		epub = TestUtils.buildEpubVolume43()

		# Build previous location
		from_resource = TestUtils.buildAmRev101LandingPage()

		# Build target
		target = TestUtils.buildEpubSubChap431()

		# Action
		action = ReadingProfile.getActionFromBundle(ReadingProfile.Actions.NAVIGATED_TO.key())

		# Fire event test - Send 50 events
		for i in 0..50
			Sensor.send(TestUtils.buildEpubNavigationEvent(learningContext, epub, action, fromResource, target))
		end

		# There should be two caliperEvents queued
		assertEquals("Expect fifty Caliper events to be sent", 50,
		             Sensor.getStatistics().getMeasures().getCount())

		# TODO - Describes test - Send five describes

		# There should be four describes queued assertEquals("Expect five describes to be sent", 5,
		# Caliper.getStatistics().getDescribes().getCount())

		# There should be two message successfully sent
		successes = Sensor.getStatistics().getSuccessful().getCount()
		assertEquals("Expect fifty messages to be sent successfully", 50, successes);

		# There should be zero failures
		failures = Sensor.getStatistics().getFailed().getCount();
		assertEquals("Expect zero message failures to be sent", 0, failures);
	end

end