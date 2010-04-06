class Post
  include MongoMapper::Document
  
  key :title, :required => true
  key :body
  key :tag_list, Array
  
  
  def tags
    tag_list
  end
  
  def tags= list_of_tags
    if list_of_tags.is_a?( String )
      @tag_list = list_of_tags.split(",")
    elsif list_of_tags.is_a?( Array )
      @tag_list = list_of_tags
    end
  end
end