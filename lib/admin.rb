module Admin
  
  class App < Sinatra::Base
    
    before do
      redirect '/account/login' unless env['warden'].user
    end
    
    get '/?' do
      @posts = Post.all( :order => '_id DESC')
      erb :'admin/index', :layout => :'admin/layout'
    end
    
    get '/posts/new/?' do
      @post = Post.new params[:post]
      erb :'admin/new', :layout => :'admin/new'
    end
    
    post '/posts/?' do
      @post = Post.new params[:post]
      if @post.save
        redirect '/admin'
      else
        erb :'admin/new', :layout => :'admin/new'
      end
    end
    
    get '/posts/:id/edit' do
      @post = Post.find(params[:id])
      erb :'admin/edit', :layout => :'admin/layout'
    end
    
    post '/posts/:id/?' do
      @post = Post.find(params[:id])
      
      if @post.update_attributes( params[:post] )
        redirect '/admin/'
      else
        erb :'admin/edit', :layout => :'admin/layout'
      end
    end
  end
  
end