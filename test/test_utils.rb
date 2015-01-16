require "test/unit"
require_relative '../lib/caliper/options'
require_relative '../lib/caliper/entities/lis/course_section'
require_relative '../lib/caliper/entities/lis/person'
require_relative '../lib/caliper/entities/learning_context'
require_relative '../lib/caliper/entities/software_application'
require_relative '../lib/caliper/entities/web_page'
require_relative '../lib/caliper/entities/reading/epub_volume'
require_relative '../lib/caliper/entities/reading/epub_sub_chapter'
require_relative '../lib/caliper/entities/schemadotorg/web_page'
require_relative '../lib/caliper/entities/reading/frame'
require_relative '../lib/caliper/event/navigation_event'

require 'json'


class TestUtils

	TESTING_HOST = "http://localhost:1080/1.0/event/put"
	API_KEY = "6xp7jKrOSOWOgy3acxHFWA"

	def initialize

	end

	def get_testing_options
		options = Caliper::Options.new
		options.host = TESTING_HOST
		options.api_key = API_KEY
		return options
	end

	def build_readium_learning_context

		software_application = Caliper::Entities::SoftwareApplication.new
		software_application.id = "https://github.com/readium/readium-js-viewer"
		software_application.name = "Readium"
		software_application.last_modified = Time.now

		learning_context = Caliper::Entities::LearningContext.new
		learning_context.ed_app = software_application
		learning_context.lis_organization = build_am_rev_101_course_section
		learning_context.agent = build_student_554433

		return learning_context
	end

	def build_epub_volume_43
		epub_volume = Caliper::Entities::Reading::EpubVolume.new
		epub_volume.id = "https://github.com/readium/readium-js-viewer/book/34843#epubcfi(/4/3)"
		epub_volume.name = "The Glorious Cause: The American Revolution, 1763-1789 (Oxford History of the United States)"
		epub_volume.last_modified = Time.now

		return epub_volume
	end

	# return Am Rev 101 course section.
	def build_am_rev_101_course_section
		course_section = Caliper::Entities::LIS::CourseSection.new
		course_section.id = "https://some-university.edu/politicalScience/2014/american-revolution-101"
		course_section.semester = "Spring-2014"
		course_section.course_number = "AmRev-101"
		course_section.label = "Am Rev 101"
		course_section.name = "American Revolution 101"
		course_section.last_modified = Time.now

		return course_section
	end

	def build_student_554433
		person = Caliper::Entities::LIS::Person.new
		person.id = "https://some-university.edu/user/554433"
		person.last_modified = Time.now

		return person
	end

	def build_am_rev_101_landing_page
			web_page = Caliper::Entities::SchemaDotOrg::WebPage.new
			web_page.id = "AmRev-101-landingPage"
			web_page.name ="American Revolution 101 Landing Page"
			web_page.part_of = build_am_rev_101_course_section
			web_page.last_modified = Time.now
			return web_page
	end

	# sample EPUB sub chapter
	def build_epub_sub_chap_431
			epub_sub_chapter = Caliper::Entities::Reading::EpubSubChapter.new
			epub_sub_chapter.id = "https://github.com/readium/readium-js-viewer/book/34843#epubcfi(/4/3/1)"
			epub_sub_chapter.name = "Key Figures: George Washington"
			epub_sub_chapter.part_of = build_epub_volume_43
			epub_sub_chapter.last_modified = Time.now
			return epub_sub_chapter
	end

	# return json object read from file
	def read_fixture_json_file
		json = File.read('fixtures/event_store_payload.json')
		obj = JSON.parse(json)
		return obj
	end

	def build_epub_navigation_event(learning_context, #LearningContext
	                                epub,             #digial resource
																	action_key,
																	from_resource,
																	target #EpubSubChapter
																	)
		navigation_event = Caliper::Event::NavigationEvent.new

		raise ArgumentError, "build_epub_navigation_event first param should be of class LearningContext" unless learning_context.is_a? Caliper::Entities::LearningContext

		navigation_event.ed_app = learning_context.ed_app
		navigation_event.lis_organization = learning_context.lis_organization
		navigation_event.actor = learning_context.agent
		navigation_event.action = action_key
		navigation_event.object = epub

		frame = Caliper::Entities::Reading::Frame.new
		frame.id = target.id
		frame.name = target.name
		frame.part_of = epub
		frame.last_modified = 1402965614516
		frame.index = 1
		navigation_event.target = frame

		navigation_event.from_resource = from_resource
		navigation_event.started_at_time = 1402965614516

		return navigation_event
	end
end