# equalish

TODO:
* Parse incoming JSON into objects
* Compare objects against canonical model
* Should support multiple input schemas, potentially with multiple versions in each schema, that all match the canonical
 object, and thus each other.

Considerations:
* Allow canonical model to specify some fields as optional?
* Should be easy to add/handle new sources, new schemas.
* Should (attempt) to support multiple versions of a given source's schema (is there even a difference between 
 SomeSchema-v1 vs SomeSchema-v2, and SomeSchema-v1 cs DifferentSchema-v1?)
* Support for multiple approaches to matching, e.g. binary (matches or doesn't), fuzzy? (considered equal if some
 threshold of rules match? not sure this would be useful, but maybe?)
* Elasticsearch... what's there that we can use?
