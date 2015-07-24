# 1. object with properties
require 'active_fedora'
require 'launchy'

class TestObject < ActiveFedora::Base
  property :title, predicate: ::RDF::DC11.title
  property :creator, predicate: ::RDF::DC11.creator
end

# create an object with some properties set
obj = TestObject.new( title: ["Green Eggs and Ham"], creator: ["Dr. Seuss"] )
obj.save
Launchy.open( "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{obj.id}" )
