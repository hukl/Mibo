# encoding: UTF-8

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "."))
require 'helper'

class PostTest < Test::Unit::TestCase

  test "adding tags to a post" do
    post = Post.create :title => "Tag", :body => "Me", :tags => "foo, bar, baz"
    assert_equal 3, post.tags.size
    assert post.tags.is_a?(Array), "Tags should return an arry"
  end
  
  test "creating a post auto creates a slug" do
    post = Post.create :title => "My Slúg 's 3 totally-awesome", :body => "Me"
    assert_equal "my-sl-g-s-3-totally-awesome", post.slug
  end
  
  test "slug must be unique" do
    Post.delete_all
    
    assert_difference "Post.count", +1 do
      2.times do
        post = Post.create :title => "My Slug 's totally-awesome", :body => "Me"
      end
    end
    
  end
  
  test "setting published_at for post" do
    post = Post.create(
      :title => "Title",
      :body => "Body",
      :published_at => "2010-04-01 00:00:00".to_time
    )
    
    assert_equal "2010-04-01 00:00:00", post.published_at.to_s(:db)
  end
  
  test "posts should have a published_at timestamp even when not specified" do
    post = Post.create :title => "My Slug 's totally-awesome", :body => "Me"
    assert_not_nil post.published_at
  end
  
  
end