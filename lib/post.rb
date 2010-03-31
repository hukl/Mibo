class Post
  include MongoMapper::Document
  
  key :title, :required => true
  key :body
end