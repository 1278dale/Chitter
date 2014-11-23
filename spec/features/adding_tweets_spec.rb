# require 'spec_helper'

# feature "User browses the list of links" do

#   before(:each) {
#     Link.create(:url => "http://www.makersacademy.com",
#                 :title => "Makers Academy")
#   }

#   scenario "when opening the home page" do
#     visit '/'
#     expect(page).to have_content("Makers Academy")
#   end
# end


feature "User adds a new tweet" do
  scenario "when browsing the homepage" do
    expect(Tweet.count).to eq(0)
    visit '/'
    add_tweet("Random Tweet")
    expect(Tweet.count).to eq(1)
    tweet = Tweet.first
    expect(tweet.content).to eq("Random Tweet")
  end

  def add_tweet(content)
    within('#new-tweet') do
      fill_in 'content', :with => content
      click_button 'Add tweet'
    end
  end
end