class User
  
  attr_accessor :id, :name
  
  def self.authenticate email, password
    if email == "foo@bar.com" && password == "password"
      user = self.new
      user.id = 1
      user
    else
      nil
    end
  end
  
  def self.get id
    user = self.new
    user.id = 1
    user.name = "Bert"
    user
  end
  
end