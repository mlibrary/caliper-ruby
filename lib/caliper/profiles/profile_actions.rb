

module Caliper
	module Profiles
			class Profile

				## navigation actions
				ACTION = {:DOWNLOADED   => "item.downloaded",
				          :UPLOADED     => "item.uploaded",
				          :LOGGED_IN    =>"session.loggedIn",
				          :LOGGED_OUT   =>"session.loggedOut",
				          :NAVIGATED_TO =>"navigation.navigatedTo"
				}

				def initialize()
				end

			end
	end
end