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