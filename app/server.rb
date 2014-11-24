require 'data_mapper'
require 'sinatra'

env = ENV['RACK_ENV'] || 'development'

# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
DataMapper.setup(:default,"postgres://localhost/chitter_#{env}")

require './app/models/tweet' # this needs to be done after datamapper is initialised
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


# post '/links' do
#   url = params["url"]
#   title = params["title"]
#   Link.create(:url => url, :title => title)
#   redirect to('/')
# end