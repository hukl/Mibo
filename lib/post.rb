class Post
  include MongoMapper::Document
  
  key :title,         :required => true
  key :slug,          :required => true
  key :published_at,  :required => true
  key :body
  key :tag_list, Array
  
  validates_uniqueness_of :slug
  
  def save
    @slug           ||= title.parameterize
    @published_at   ||= Time.now
    super
  end
  
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