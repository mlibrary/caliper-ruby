module Caliper
  class Options
    attr_accessor :api_key
    attr_accessor :host
    attr_accessor :time_out
  end

	def initialize()
		@host = Defaults.HOST
		@time_out = Defaults.CONNECTION_TIMEOUT
	end

	def initialize(host, time_out)
		@host = host
		@time_out = time_out
	end

end
