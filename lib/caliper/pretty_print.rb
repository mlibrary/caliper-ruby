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
# Module that supports pretty-printing without object IDs for more meaningful diffs.
#
module Caliper
  module PrettyPrint

    def pretty_print(printer)
      printer.object_group(self) do
        printer.seplist(pretty_print_instance_variables, lambda { printer.text ',' }) do |v|
          printer.breakable
          v = v.to_s if Symbol === v
          printer.text v
          printer.text '='
          printer.group(1) do
            printer.breakable ''
            printer.pp instance_eval(v)
          end
        end
      end
    end

  end
end
