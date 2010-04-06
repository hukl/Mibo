$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "."))

require 'helper'

class AdminTest < Test::Unit::TestCase
  include Rack::Test::Methods
  include Warden::Test::Helpers
  after{ Warden.test_reset! }
  
  def app
    Admin::App
  end
    
  test "index page should render successfully" do
    login_as("Joe")
    get '/'
    puts last_response.body
    assert_equal 200, last_response.status, "Wasn't a 200"
  end
  
end