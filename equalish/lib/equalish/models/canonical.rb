module Equalish
  module Models
    module Canonical

      module ClassMethods
        attr_accessor :canonical_fields
        attr_accessor :normalized_data

        def equalish_comparison_method(comparison_method)
          @comparison_method = comparison_method
        end

        def canonicalize(canonical_field, equivocal_fields)
          @canonical_fields = Hash.new if @canonical_fields.nil?
          @normalized_data = Hash.new if @normalized_data.nil? 

          @canonical_fields[canonical_field] = [canonical_field, equivocal_fields].flatten
          @normalized_data[canonical_field] = yield

          puts @canonical_fields.inspect
          puts @normalized_data.inspect
        end
      end

      def self.included(klass)
        @canonical_fields = {}
        @normalized_data = {}
        klass.extend ClassMethods
      end
    end
  end
end
