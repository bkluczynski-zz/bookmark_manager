ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require './app/models/link.rb'
require './app/models/tag.rb'
require './app/models/user.rb'
require './data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base
register Sinatra::Partial
use Rack::MethodOverride
  enable :sessions
   set :session_secret, 'super secret'
   register Sinatra::Flash


  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new
  end

  post '/links' do

    link = Link.create(url: params[:url], title: params[:title])
    params[:tag].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect "/links"
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :links
  end

  post '/sign_up' do
    @user = User.create(email_address: params[:email_address],
      password: params[:password],
      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
  end
  end

  get '/sign_up' do
    @user = User.new
    erb :sign_up
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email_address], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/links')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/links'
  end

  get '/sign_up/recover' do
    "Please enter your email address"
  end

  helpers do
    def current_user
   @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

#"tag1 tag2"
#[tag1, tag2]
