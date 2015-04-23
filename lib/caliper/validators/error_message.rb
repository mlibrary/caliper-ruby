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

#
# Error Message.
#
module Caliper
	module Validators
		class ErrorMessage

			attr_accessor :text

			def initialize
				@text = ""
			end

			# append comma if appropriate when building conformance violation message
			def append_text(text)
				if (@text.length == 0)
					# assign text value
					@text = text
				else
					# append text value
					@text = @text + ",\n" + text + "\n"
				end
			end

			# prepend text
			# typically a Caliper conformance clause that prefixes a string of one or more violations.
			def prepend_text(text)
				@text = text + "\n" + @text
			end

			# append period and end sentence
			def end_sentence
				@text = @text + "."
			end

			def end_message(text)
				prepend_text(text)
				end_sentence
			end

			def length
				return @text.length
			end
		end
	end
end