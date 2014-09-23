# 3. start with simple object with title
require 'active_fedora'

class TestObject < ActiveFedora::Base
  property :title, predicate: RDF::DC11.title
  property :creator, predicate: RDF::DC11.creator
end

# create an object and set a property and datastream content
obj = TestObject.new( title: "Test Object Title", creator: "Dr. Seuss" )
obj.save
puts "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{obj.pid}"
