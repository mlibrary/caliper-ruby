require 'atomic'

# extends the atomic class with several new functions
module Caliper
	module Stats
		class AtomicWrapper < Atomic


			def initialize(value)
				super.initialize(value)
			end

			# Atomically sets to the given value and returns the old value.
			def get_and_set(new_value)
				current = @value
				if (compare_and_set(current, new_value))
					current
				end
			end

			# Atomically increments by one and returns the old value.
			def get_and_increment()
				current = @value
				new_value = current + 1
				if (compare_and_set(current, new_value))
					current
				end
			end

			# Atomically decrements by one and returns the old value.
			def get_and_decrement()
				current = @value
				new_value = current - 1
				if (compare_and_set(current, new_value))
					current
				end
			end

			# Atomically adds the given value to the current value
			# Return the old value
			def get_and_add(delta)
				current = @value
				new_value = current + delta
				if (compare_and_set(current, new_value))
					current
				end
			end

			# Atomically increments by one the current value.
			# Return the updated value
			def increment_and_get()
				current = @value
				new_value = current + 1
				if (compare_and_set(current, new_value))
					new_value
				end
			end

			# Atomically decrements by one the current value.
			# Return the updated value
			def decrement_and_get()
				current = @value
				new_value = current - 1
				if (compare_and_set(current, new_value))
					new_value
				end
			end

			# Atomically adds the given value to the current value.
			# Return the updated value
			def add_and_get(delta)
				current = @value
				new_value = current + delta
				if (compare_and_set(current, new_value))
					new_value
				end
			end

			# Returns the String representation of the current value.
			def to_string()
				return @value.to_s
			end

		end
	end
end
