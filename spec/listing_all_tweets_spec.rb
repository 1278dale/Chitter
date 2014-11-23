# Create the first test listing_all_links_spec.rb that visits the homepage and checks that the link we put in the database is there.

require 'spec_helper'

  feature "User browses the list of tweets" do

    before(:each) {Tweet.create(:content => "Random Tweet")}

    scenario "When opening the home page" do
      visit '/'
      expect(page).to have_content("Random Tweet")
    end
  end







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
