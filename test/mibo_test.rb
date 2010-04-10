$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "."))

require 'helper'

class MiboTest < Test::Unit::TestCase
  include Rack::Test::Methods
  
    
  test "index page should render successfully" do
    get '/'
    assert_equal 200, last_response.status, "Wasn't a 200"
  end
  
  test "show a post" do
    post = Post.create :title => "My first post", :body => "Me"
    get '/my-first-post'
    assert_equal 200, last_response.status, "Wasn't a 200"
  end
  
end