# equalish
Equalish is a gem that allows you to define certain fields on objects as "canonical", along with an array of data that is considered equivalent to the canonical object's data for that field.

## Installing
* Clone this repo
* `cd equalish`
* `bundle install`

## Tests
```
┌─[charris@Hephaestus2] - [~/src/equalish] - [Tue Sep 17, 06:37]
└─[$] <git:(master)> cd equalish
┌─[charris@Hephaestus2] - [~/src/equalish/equalish] - [Tue Sep 17, 06:37]
└─[$] <git:(master)> rake test
Run options: --seed 38679

# Running:

...

Finished in 0.000744s, 4032.2906 runs/s, 2688.1937 assertions/s.

3 runs, 2 assertions, 0 failures, 0 errors, 0 skips
```


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
