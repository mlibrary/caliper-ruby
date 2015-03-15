# require 'spec_helper.rb'
require 'require_all'
require_all 'lib/caliper/entities/entity.rb'

module Caliper
  module Entities

    describe Entity do
      
      it "should ensure that a base entity is correctly created and serialized" do
        entity = Entity.new
        entity.name = 'test'
        entity.id = 'https://some-university.edu/politicalScience/2014/american-revolution-101/assessment1'
        entity.properties = {'customProp' => 42}
        puts "Entity JSON = #{entity.to_json}"

        file = File.read('spec/lib/entities/entity.json')
        data_hash = JSON.parse(file)
        puts "JSON from file = #{data_hash}"

        des_entity = Entity.new
        des_entity.from_json data_hash
        puts "Object from JSON = #{des_entity.to_json}"

        expect(entity).to eql(des_entity)
      end

    end
  end
end