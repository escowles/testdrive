# 5. xml datastreams still work
require 'active_fedora'

class TestObject < ActiveFedora::Base
  property :title, predicate: RDF::DC11.title
  property :creator, predicate: RDF::DC11.creator
  has_file_datastream name: 'ds1'
  has_metadata 'dc', type: ActiveFedora::QualifiedDublinCoreDatastream
  has_attributes :publisher, datastream: 'dc'
end

# create an object and set a property and datastream content
obj = TestObject.new( title: "Test Object Title", creator: "Dr. Seuss" )
obj.publisher = "Random House"
obj.ds1.content = "Test Datastream Content"
obj.ds1.original_name = 'test.txt'
obj.save
puts "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{obj.pid}"
