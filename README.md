# equalish

## Equalish is a gem that allows you to define certain fields on objects as "canonical", along with an array of data that is considered equivalent to the canonical object's data for that field.

## Example

```
class SomeCanonicalModel
  extends ::Equalish::Models::Canonical

  canonicalize :some_field, "canonical data string" do
    ['this is acceptable', 'this is also acceptable']
  end
end

class MyOtherModel
  attr_accessor :some_field
  
  def initialize(some_field:)
    @some_field = some_field
  end
end

equivocal_model = MyOtherModel.new(some_field: 'this is acceptable')
not_equivocal = MyOtherModel.new(some_field: 'totally not acceptable'')

#returns true
SomeCanonicalModel.is_canonical_for?(equivocal)

#returns false
SomeCanonicalModel.is_canonical_for?(not_equivocal)
```
