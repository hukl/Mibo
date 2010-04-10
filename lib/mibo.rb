module Mibo
  
  class App < Sinatra::Base
    
    helpers do
      
      def texilize text
        RedCloth.new(text).to_html
      end
      
    end
    
    
    get '/css/style.css' do
      content_type 'text/css', :charset => 'utf-8'
      less :stylesheet
    end
    
    get '/' do
      @posts = Post.all( :order => '_id DESC')
      erb :'posts/index'
    end
    
    get %r{/([a-z0-9\-]+)/?$} do |slug|
      @post = Post.find_by_slug( slug )
      erb :'posts/show'
    end
    
    
  end
  
end