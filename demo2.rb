# 2. add a file (formerly datastream)
require 'active_fedora'

class TestObject < ActiveFedora::Base
  property :title, predicate: ::RDF::DC11.title
  property :creator, predicate: ::RDF::DC11.creator
  contains 'ds1'
end

# Create an object and set a property and file content
# When you download datastreams from fedora, the filename will be whatever you set as its original_name
obj = TestObject.new( title: "The Lorax", creator: "Dr. Seuss" )
obj.ds1.content = "I speak for the trees."
obj.ds1.original_name = 'lorax.txt'
obj.save
puts "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{obj.id}"
