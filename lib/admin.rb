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
      erb :'admin/new', :layout => :'admin/layout'
    end
    
    post '/posts/' do
      @post = Post.new params[:post]
      if @post.save
        redirect '/admin'
      else
        erb :'admin/new', :layout => :'admin/layout'
      end
    end
    
    get '/posts/:id/edit/?' do
      @post = Post.find( params[:id] )
      erb :'admin/edit', :layout => :'admin/layout'
    end
    
    get '/posts/:id/delete/?' do
      @post = Post.find( params[:id] )
      erb :'admin/delete'
    end
    
    delete '/posts/:id' do
      post = Post.find( params[:id] )
      post.delete if post
      redirect '/admin'
    end
    
    put  %r{/posts/([a-z0-9\-]+)/?$} do |id|
      @post = Post.find( id )
      
      if @post.update_attributes( params[:post] )
        redirect '/admin/'
      else
        erb :'admin/edit', :layout => :'admin/layout'
      end
    end
    
  end
  
end
