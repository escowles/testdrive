require 'active_fedora'
require 'launchy'

class TestObject < ActiveFedora::Base
  property :title, predicate: RDF::DC11.title
  property :creator, predicate: RDF::DC11.creator
  has_file_datastream name: 'ds1'
end

# create an object and set a property and datastream content
obj = TestObject.new( title: "Test Object Title", creator: "Dr. Seuss" )
obj.ds1.content = "Test Datastream Content"
obj.ds1.original_name = 'test.txt'
obj.save
puts "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{obj.pid}"
Launchy.open( "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{obj.pid}")
