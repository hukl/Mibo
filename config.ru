require 'init'
use Rack::Session::Cookie

map "/" do 
  enable :sessions
  
  use Warden::Manager do |manager|
    manager.default_strategies :password
    manager.failure_app = Account::App
  end
  
  run Mibo::App
end

map "/account" do
  
  enable :sessions
  
  use Warden::Manager do |manager|
    manager.default_strategies :password
    manager.failure_app = Account::App
  end
  
  run Account::App
end

map "/admin" do
  
  enable :sessions
  
  use Warden::Manager do |manager|
    manager.default_strategies :password
    manager.failure_app = Account::App
  end
  
  run Admin::App
end