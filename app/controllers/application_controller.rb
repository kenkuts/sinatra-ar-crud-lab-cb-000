require_relative '../../config/environment'
require_all 'app/models'

class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  # Create new posts with a name and content
  get '/posts/new' do
    erb :new
  end

  # Creates a model object and persists it
  # to the database. This post method also
  # displays all the posts from newest to
  # oldest.
  post '/posts' do
    Post.create(name: params[:name], content: params[:content])
    @posts = Post.all

    erb :index
  end

  # Displays all the posts from newest to oldest.
  get '/posts' do
    @posts = Post.all

    erb :index
  end

  # Finds and displays a specific post number
  get '/posts/:id' do
    @post = Post.find(params[:id])

    erb :single_post
  end

  # Updates a posts name and content
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :update_post
  end

  # This method updates our current post record.
  # It finds the post with the same id and updates the name and the content
  # simultaneously.
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])

    erb :single_post
  end

  delete '/posts/:id' do
    Post.find(params[:id]).destroy

    redirect to '/posts'
  end

end
