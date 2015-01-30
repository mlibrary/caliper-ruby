
# an Interface module, define method to be implemented
module Interface
	def method(name)
		define_method(name) { |*args|
			raise "interface method #{name} not implemented"
		}
	end
end