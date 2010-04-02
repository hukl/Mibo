require 'init'
use Rack::Session::Cookie, :secret => 'Wh@teverfl0atsYourB23oat'
enable :method_override

map "/" do 
  use Warden::Manager do |manager|
    manager.default_strategies :password
    manager.failure_app = Account::App
  end
  
  run Mibo::App
end

map "/account" do
  use Warden::Manager do |manager|
    manager.default_strategies :password
    manager.failure_app = Account::App
  end
  
  run Account::App
end

map "/admin" do
  use Warden::Manager do |manager|
    manager.default_strategies :password
    manager.failure_app = Account::App
  end
  
  run Admin::App
end