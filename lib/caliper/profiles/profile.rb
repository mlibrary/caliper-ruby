
require 'i18n'

module Caliper
	module Profiles
		module ProfileActions
			DOWNLOADED = "item.downloaded"
			UPLOADED = "item.uploaded"
			LOGGED_IN = "session.loggedIn"
			LOGGED_OUT = "session.loggedOut"
			NAVIGATED_TO = "navigation.navigatedTo"
		end
		class Profile
			include ProfileActions

			def initialize()
			end

			def get_navigated_to_action_from_bundle(key)
				if key.equal? ProfileActions::NAVIGATED_TO
					return I18n.translate :action
				end
			end
		end
	end
end