require 'active_fedora'
require 'active_fedora/aggregation'
require 'launchy'

class TestObject < ActiveFedora::Base
  property :title, predicate: ::RDF::DC11.title
  ordered_aggregation :test_objects, through: :list_source
end

# create an object and add ordered members
member1 = TestObject.new title: ['Thing 1']
member2 = TestObject.new title: ['Thing 2']
obj = TestObject.new title: ['My Object']
obj.ordered_test_objects = [member1, member2]
obj.save
puts "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{obj.id}"
Launchy.open( "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{obj.id}")
