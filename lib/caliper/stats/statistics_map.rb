module Caliper
	module Stats
		class StatisticsMap < Hash

			# Make sure the key value exists in the hashmap
			# Add the key value if not found before
			def ensure(key)
				# returns key-ed vale if key exists
				if has_key?(key)
					return fetch(key)
				end

				# else insert the key
				statistic = Statistic.new()
				this.put(key, statistic)
				return statistic
			end

			# Insert a new Statistic object if there is no key with specified value
			# Otherwise, update the hashed value with the value provided
			def update(operation, val)
				if (!has_key?(operation))
					this.put(operation, Statistic.new())
				end
				this.fetch(operation).update(val)
			end

			# the pretty formatted string output
			def to_s
				r_string = "\r-------- Caliper Java Statistics --------\r";
				hash.each do |key, value|
					statistics = 	value;
					r_string = r_string + "%s : %s\r", key, statistic.to_s()
				end
				return r_string
			end
		end
	end
end