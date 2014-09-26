# 4. datastream versioning
require 'active_fedora'

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

obj.ds1.create_version
obj.ds1.content = "New Version of Datastream Content"
obj.save
puts obj.ds1.versions
puts "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{obj.pid}"
