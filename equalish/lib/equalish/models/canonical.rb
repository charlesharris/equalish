module Equalish
  module Models
    module Canonical

      module ClassMethods
        def equalish_comparison_method(comparison_method)
          @comparison_method = comparison_method
        end

        def canonicalize(canonical_field, equivocal_fields)
          @accepted_fields = yield || nil
        end
      end

      def self.included(klass)
        klass.extend ClassMethods
      end
    end
  end
end
