module Account
  
  class App < Sinatra::Base
    get "/" do
      env['warden'].user.name if env['warden'].user
    end
    
    get '/login/?' do
      erb :'account/login'
    end
    
    post '/login/?' do
      env['warden'].authenticate!
      redirect "/"
    end
    
    get '/logout/?' do
      env['warden'].logout
      redirect '/'
    end
      
    post '/unauthenticated/?' do
      status 410
      "Could not login"
    end
  end
end