require_relative '../../config/environment'
require_all 'app/models'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(name: params[:name], content: params[:content])
    @posts = Post.all

    erb :index
  end

  get '/posts' do
    Post.create(name: params[:name], content: params[:content])
    @posts = Post.all

    erb :index
  end

end
