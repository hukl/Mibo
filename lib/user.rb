class User
  
  include MongoMapper::Document
  include BCrypt
  
  key :user_name
  key :email
  key :password_hash
  
  def password
    @password ||= Password.new(password_hash)
  end
  
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
  
  def self.authenticate email, password
    user = User.find_by_email( email )
    if user && user.password == password
      user
    else
      nil
    end
  end
  
  def self.get id
    user = User.find( id )
    user
  end
  
end