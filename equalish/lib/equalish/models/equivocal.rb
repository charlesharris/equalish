module Equalish
  module Models
    module Equivocal

      module ClassMethods
        def canonical_model(canonical_model_class)
          @canonical_model = canonical_model_class
        end

        def ==(other)
          canonical = @canonical_model.new
          self.instance_variables.each do |v|
            puts v
          end
        end
      end

      def self.included(klass)
        klass.extend ClassMethods
      end

    end
  end
end
