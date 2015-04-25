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

# require 'spec_helper.rb'
require 'require_all'
require 'json_spec'
require_all 'lib/caliper/entities/*.rb'
require_all 'lib/caliper/entities/agent/person.rb'
require_all 'lib/caliper/entities/lis/*.rb'

#
# Test Person.
#
module Caliper
  module Entities
    module Agent
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
          file = File.read('spec/lib/entities/agent/student.json')
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