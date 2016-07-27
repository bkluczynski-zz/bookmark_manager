require 'data_mapper'
require 'dm-postgres-adapter'
require 'data_mapper_setup'


class Tagging

include DataMapper::Resource

belongs_to :tag, :key => true
belongs_to :link, :key => true

end
