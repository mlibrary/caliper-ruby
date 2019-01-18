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
# Module allowing Caliper classes to declare contexts.
#
# The 'caliper_context' class method declares a context for a class. Contexts are inherited by subclasses.
#
# On object initialization, an instance variable with accessors is created for the context, and set to the class-
# declared value unless otherwise specified in the options hash.
#
module Caliper
  module Contexts

    CONTEXT = 'http://purl.imsglobal.org/ctx/caliper/v1p1'
    CONTEXTS = [CONTEXT]

    attr_accessor :context

    # During object initialization, set context from the options hash, falling back to the class-defined default
    # when not specified.
    def initialize_context(opts)
      @context = opts.has_key?(:context) ? opts[:context] : self.class.context
    end

    module ClassMethods
      # Declare a context for a class.
      def caliper_context(context)
        @context = context
      end

      # Get the context for a class. Contexts are stored as shallow-copied class instance variables to avoid unexpected
      # inheritance behavior.
      def context
        @context ||= (superclass.respond_to?(:context) ? superclass.context.dup : nil)
      end
    end

    def self.included(base)
      base.extend ClassMethods
    end
  end
end
