# require 'spec_helper.rb'
require 'require_all'
require_all 'lib/caliper/entities/*.rb'
require_all 'lib/caliper/entities/lis/*.rb'

module Caliper
  module Entities
    module LIS
      describe Person do

        it "should ensure that a Person is correctly created and serialized" do
          student = Person.new
          student.id = 'https://some-university.edu/students/dent_stu'
          student.name = 'Stu Dent'
          student.description = 'A super bright individual'
          student.extensions = {'customProp' => 42}
          student.dateCreated = '2015-03-15T23:09:11.000Z'
          student.dateModified = '2015-03-15T23:09:11.000Z'
          # puts "new student = #{student.to_json}"

          # Compare JSON ouput
          file = File.read('spec/lib/entities/lis/student.json')
          data_hash = JSON.parse(file)
          expected_json = data_hash.to_json # convert hash back to JSON string after parse
          student.to_json.should be_json_eql(expected_json)

          des_student = Person.new
          des_student.from_json data_hash
          # puts "Object from JSON = #{des_student.to_json}"

          expect(student).to eql(des_student)
        end

      end
    end
  end
end
