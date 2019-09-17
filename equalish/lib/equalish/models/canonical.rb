module Equalish
  module Models
    module Canonical

      module ClassMethods
        attr_accessor :canonicalized
        def init_canonical
          @canonicalized = Hash.new
        end

        def equalish_comparison_method(comparison_method)
          @comparison_method = comparison_method
        end

        def canonicalize(canonical_field, canonical_data)
          equivalent_data = yield || []
          @canonicalized[canonical_field.to_sym] = equivalent_data.append(canonical_data)
        end
      end

      def self.included(klass)
        klass.extend ClassMethods
        klass.init_canonical
      end
    end
  end
end
