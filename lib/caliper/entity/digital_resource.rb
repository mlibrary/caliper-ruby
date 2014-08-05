module Caliper
  module Entity
    class DigitalResource < Base
      attr_accessor :name, :parent_ref, :learning_objectives, :keywords, :about, :language
    end
  end
end
