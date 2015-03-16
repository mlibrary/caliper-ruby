# require 'spec_helper.rb'
require 'require_all'
require_all 'lib/caliper/entities/entity.rb'
require_all 'lib/caliper/entities/software_application.rb'
require_all 'lib/caliper/entities/lis/person.rb'
require_all 'lib/caliper/event/session_event.rb'
require_all 'lib/caliper/profiles/session_profile.rb'

module Caliper
  module Event

    describe SessionEvent do

      it "should ensure that a SessionEvent (login) is correctly created and serialized" do
        student = Caliper::Entities::LIS::Person.new
        student.id = 'https://some-university.edu/user/554433'
        student.dateCreated = '2015-01-01T06:00:00Z'
        student.dateModified = '2015-02-02T11:30:00Z'
        # puts "new student = #{student.to_json}"

        action = Caliper::Profiles::SessionActions::LOGGED_IN;

        edApp = Caliper::Entities::SoftwareApplication.new
        edApp.id = 'https://github.com/readium/readium-js-viewer'
        edApp.name = 'Readium'
        edApp.dateCreated = '2015-01-01T06:00:00Z'
        edApp.dateModified = '2015-02-02T11:30:00Z'

        entity = Caliper::Entities::Entity.new
        entity.name = 'test'
        entity.description = 'description'
        entity.id = 'https://some-university.edu/politicalScience/2014/american-revolution-101/assessment1'
        entity.extensions = {'customProp' => 42}
        entity.dateCreated = '2015-03-15T23:09:11Z'
        entity.dateModified = '2015-03-15T23:09:11Z'
        # puts "Entity JSON = #{entity.to_json}"

        session_event = SessionEvent.new
        session_event.actor  = student
        session_event.action = action
        session_event.object = edApp
        session_event.edApp  = edApp
        puts "Event JSON = #{session_event.to_json}"

      end

    end
  end
end
