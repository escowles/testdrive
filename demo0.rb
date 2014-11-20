require 'active_fedora'
require 'launchy'

class TestObject < ActiveFedora::Base
  property :title, predicate: ::RDF::DC11.title
  property :creator, predicate: ::RDF::DC11.creator
  has_file_datastream name: 'ds1'
end

# create an object and set a property and datastream content
obj = TestObject.new( title: "Oh, the Places You'll Go!", creator: "Dr. Seuss" )
obj.ds1.content = "Congratulations! Today is your day. You're off to Great Places! You're off and away!"
obj.ds1.original_name = 'oh the places youll go.txt'
obj.save
puts "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{obj.id}"
Launchy.open( "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{obj.id}")
