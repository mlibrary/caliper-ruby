require "json"

##
##  The base Caliper Entity.  Analogous to a schema.org Thing.
##
module Caliper
  module Entities
    class Entity

			attr_accessor :id, :name, :last_modified

			def initialize()
				@id = ""
				@name = ""
				@last_modified = ""
			end
    end
  end
end
