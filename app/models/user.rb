
class User

include DataMapper::Resource

property :id, Serial
property :email_address, String
# property :password, String

end
