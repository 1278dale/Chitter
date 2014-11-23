class Tweet

  include DataMapper::Resource

  property :id,         Serial
  property :content,      String

end

# This file describes the relationship between the table in the database (they don't exist yet) and this Ruby class

# tweet model


# Since Chitter is going to manage collection of tweet
# it will need a table to store them. So create model in app/tweet.rb