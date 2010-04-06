$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "."))
require 'helper'

class PostTest < Test::Unit::TestCase

  test "adding tags to a post" do
    post = Post.create :title => "Tag", :body => "Me", :tags => "foo, bar, baz"
    assert_equal 3, post.tags.size
    assert post.tags.is_a?(Array), "Tags should return an arry"
  end

end