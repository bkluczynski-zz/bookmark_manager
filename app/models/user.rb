require 'bcrypt'


class User

# include BCrypt

include DataMapper::Resource

property :id, Serial
property :email_address, String
property :password_digest, String, length: 60


# property :password, String

  # users.password_hash in the database is a :string

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end



  # def password=(new_password)
  #   # @password = Password.create(new_password)
  #   self.password_hash = @password
  # end


end
