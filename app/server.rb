require 'data_mapper'
require 'sinatra'
require './app/models/tweet' # this needs to be done after datamapper is initialised
require_relative 'helpers/application'
require 'rack-flash'

enable :sessions
set :session_secret, 'super secret'


use Rack::Flash

set :views, Proc.new{File.join(root, 'views')}

env = ENV['RACK_ENV'] || 'development'

# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
DataMapper.setup(:default,"postgres://localhost/chitter_#{env}")

require './app/models/user'

# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!

get '/' do
  @tweets = Tweet.all
  erb :index
end

post '/tweets' do
  content = params["content"]
  Tweet.create(:content => content)
  redirect to('/')
end

get '/users/new' do
  @user = User.new
  erb :"users/new"
end

post '/users' do
  @user = User.create(
              :email => params[:email],
              :username => params[:username],
              :password => params[:password],
              :password_confirmation => params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    flash[:errors] = @user.errors.full_messages
    redirect to('/users/new')
  end
end
