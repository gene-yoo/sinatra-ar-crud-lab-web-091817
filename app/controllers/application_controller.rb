require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  # New
  get '/posts/new' do
    erb :new
  end

  # Create
  post '/posts' do
    Post.create(params[:post])
    redirect "/posts"
  end

  # Show
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  # Read
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  # Update
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    post = Post.find(params[:id])
    post.update_attributes(params[:post])
    redirect "/posts/#{post.id}"
  end

  # Delete
  delete '/posts/:id' do
    post = Post.find(params[:id])
    @name = post.name
    post.destroy
    erb :delete
  end
end
