$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "."))

require 'helper'

class AdminTest < Test::Unit::TestCase
  include Rack::Test::Methods
  include Warden::Test::Helpers
  after{ Warden.test_reset! }
  
  
  test "index page should render successfully when user logged in" do
    Post.destroy_all
    login_as(User.new :user_name => "Peter")
    get '/admin/'
    assert_equal 200, last_response.status, "Wasn't a 200"
  end
  
  test "user should be redirected to login when logged out" do
    Post.destroy_all
    get '/admin/'
    assert_equal 302, last_response.status, "Wasn't a 302"
  end
  
end