# 3. link w/custom predicate
require 'active_fedora'

class MYVOCAB < RDF::Vocabulary("http://example.org/vocab/")
  property :creator
end
class TestConcept < ActiveFedora::Base
  property :label, predicate: RDF::SKOS.prefLabel
end
class TestObject < ActiveFedora::Base
  property :title, predicate: RDF::DC11.title
  property :creator, predicate: MYVOCAB.creator, class_name: 'TestConcept'
  has_file_datastream name: 'ds1'
end

# create dr. seuss record
dr_seuss = TestConcept.new( label: "Dr. Seuss" )
dr_seuss.save

# create an object and set a property and datastream content
obj = TestObject.new( title: "The Cat in the Hat", creator: dr_seuss.rdf_subject )
obj.save
puts "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{obj.pid}"
