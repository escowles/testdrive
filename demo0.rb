# 0. roundtrip an object with a title
require 'active_fedora'

class TestObject < ActiveFedora::Base
  property :title, predicate: RDF::DC11.title
end

# create an object and set a property and datastream content
obj = TestObject.new( title: "Test Object Title" )
obj.save
puts "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{obj.pid}"

obj2 = TestObject.find( pid: obj.pid )
puts obj2.first.title
