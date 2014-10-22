# 4. datastream versioning
require 'active_fedora'

class TestObject < ActiveFedora::Base
  property :title, predicate: RDF::DC11.title
  property :creator, predicate: RDF::DC11.creator
  has_file_datastream name: 'ds1'
end

# create an object and a datastream, then update the datasream's content once,
# causing the datastream to have two versions in its history
obj = TestObject.new( title: "One Fish Two Fish", creator: "Dr. Seuss" )
obj.ds1.content = "One Fish, Two Fish"
obj.ds1.original_name = 'test.txt'
obj.save

obj.ds1.create_version
obj.ds1.content = "Red Fish, Blue Fish"
obj.save
puts "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{obj.pid}"

puts obj.ds1.versions
