# 4. File versioning
require 'active_fedora'

class TestObject < ActiveFedora::Base
  property :title, predicate: ::RDF::DC11.title, multiple:false
  property :creator, predicate: ::RDF::DC11.creator
  contains 'ds1'
end

# create an object and a file, then update the file's content once,
# causing the file to have two versions in its history
obj = TestObject.new( title: "One Fish Two Fish", creator: ["Dr. Seuss"] )
obj.ds1.content = "One Fish, Two Fish"
obj.ds1.original_name = 'test.txt'
obj.save

obj.ds1.create_version
obj.ds1.content = "Red Fish, Blue Fish"
obj.save

puts "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{obj.id}"
puts obj.ds1.versions
