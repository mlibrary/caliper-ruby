module Caliper
  module Event
    class Event
      attr_accessor :context, # String Required - the JSON-LD context for the Event

                    # Required - the type of the Event
                    :type, # String

                    # Learning Context
                    :ed_app,  # SoftwareApplication

                    # LIS organization
                    :lis_organization, # Organization

                    # Required - Agent (User, System) that performed the action
                    :actor, # Agent

                    # Required - Action performed by Agent From Metric Profile
                    :action, # String

                    # Required - "Activity Context" from Metric Profile
                    :object, # Object

                    # Optional - "target" from Metric Profile
                    :target, # Targetable

                    # Optional - entity "generated" as result of action - from Metric Profile
                    :generated, # Generatable

                    # Required time in milliseconds that the event was started at
                    :started_at_time, # long

                    # An optional time in milliseconds that the event ended at
                    :ended_at_time, # long

                    # An xsd:duration (http://books.xmlschemata.org/relaxng/ch19-77073.html)
							      # The format is expected to be PnYnMnDTnHnMnS
							      # Valid values include PT1004199059S, PT130S, PT2M10S, P1DT2S, -P1Y, or P1Y2M3DT5H20M30.123S.
							      # The following values are invalid: 1Y (leading P is missing), P1S (T separator is missing),
                    # P-1Y (all parts must be positive), P1M2Y (parts order is significant and Y must precede M)                                                                                                * or P1Y-1M (all parts must be positive).                                                                               */
                    :duration # String
    end
  end
end
