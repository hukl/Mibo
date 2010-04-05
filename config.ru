require 'init'

use Rack::Session::Cookie, :secret => 'Wh@teverfl0atsYourB23oat'
use Rack::MethodOverride
use Warden::Manager do |manager|
  manager.default_strategies :password
  manager.failure_app = Account::App
end

map "/" do 
  run Mibo::App
end

map "/account" do
  run Account::App
end

map "/admin" do
  run Admin::App
end