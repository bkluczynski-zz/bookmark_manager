require 'data_mapper'
require 'dm-postgres-adapter'


class Tag

include DataMapper::Resource

property :id, Serial
property :name, Text


has n, :taggings
has n, :links, :through => :taggings


end
