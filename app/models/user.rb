# class User

#   include DataMapper::Resource

#   property :id, Serial
#   property :email, String
require 'bcrypt'
# end


class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, :unique => true, :message => "This email has already been taken"
  property :username, String, :unique => true, :message => "This username has already been taken"

  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, :message => "Sorry, your passwords don't match"

  validates_uniqueness_of :email

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
end