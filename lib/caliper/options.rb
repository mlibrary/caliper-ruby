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
# Options.
#
module Caliper
  class Options
    attr_accessor :host, :api_key, :connection_request_time_out, :connection_time_out, :socket_time_out

    def initialize(options = {})
      self.host = options[:host] || Defaults::HOST
      self.api_key = options[:api_key] || ''
      self.connection_request_time_out = options[:connection_request_time_out] || Defaults::CONNECTION_REQUEST_TIMEOUT
      self.connection_time_out = options[:connection_time_out] || Defaults::CONNECTION_TIMEOUT
      self.socket_time_out = options[:socket_time_out] || Defaults::SOCKET_TIMEOUT
    end
  end
end
