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

require_relative '../../entities/digital_resource'
require_relative '../../entities/targetable'

#
# A Frame
#
module Caliper
	module Entities
		module Reading
			class Frame < Caliper::Entities::DigitalResource
				include Caliper::Entities::Targetable

				attr_accessor :index

				def initialize
					super
					@type = DigitalResourceType::FRAME
					@index = 0
				end
			end
		end
	end
end