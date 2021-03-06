# 5. xml datastreams still work
# If you are creating new objects with Fedora, we discourage using XML datastreams.
# They are prevalent in legacy systems, so must be supported, but it's best to use the default RDF behaviors.
require 'active_fedora'
require 'launchy'

class TestObject < ActiveFedora::Base
  property :title, predicate: ::RDF::DC11.title
  property :creator, predicate: ::RDF::DC11.creator
  contains 'ds1'
  contains 'dc', class_name: 'ActiveFedora::QualifiedDublinCoreDatastream'
  property :publisher, delegate_to: 'dc'
end

# create an object and set a property stored in datastream content
obj = TestObject.new( title: ["A Wrinkle in Time"], creator: ["Madeleine L’Engle"] )
obj.publisher = ["Macmillan"]
obj.ds1.content = "Life, with its rules, its obligations, and its freedoms, is like a sonnet: You're given the form, but you have to write the sonnet yourself."
obj.ds1.original_name = 'a wrinkle in time.txt'
obj.save
Launchy.open( "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{obj.id}" )
