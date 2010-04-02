module Admin
  
  class App < Sinatra::Base
    
    before do
      redirect '/account/login' unless env['warden'].user
    end
    
    get '/?' do
      "hallo from the admin"
    end
    
  end
  
end