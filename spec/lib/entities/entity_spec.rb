# require 'spec_helper.rb'
require 'require_all'
require 'json_spec'
require_all 'lib/caliper/entities/entity.rb'

module Caliper
  module Entities

    describe Entity do

      it "should ensure that a base entity is correctly created and serialized" do
        entity = Entity.new
        entity.name = 'test'
        entity.description = 'description'
        entity.id = 'https://some-university.edu/politicalScience/2014/american-revolution-101/assessment1'
        entity.extensions = {'customProp' => 42}
        entity.dateCreated = '2015-03-15T23:09:11.000Z'
        entity.dateModified = '2015-03-15T23:09:11.000Z'
        # puts "Entity JSON = #{entity.to_json}"

        # Compare JSON ouput
        file = File.read('spec/lib/entities/entity.json')
        data_hash = JSON.parse(file)
        expected_json = data_hash.to_json # convert hash back to JSON string after parse
        entity.to_json.should be_json_eql(expected_json)#.excluding("@class")

        # Compare Deserialized JSON to desired Entity
        des_entity = Entity.new
        des_entity.from_json data_hash
        # puts "Object from JSON = #{des_entity.to_json}"
        expect(entity).to eql(des_entity)

      end

    end
  end
end
