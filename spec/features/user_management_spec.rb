# feature "User signs up" do
#   # Strictly speaking, the tests that check the UI
#   # (have_content, etc.) should be separate from the tests
#   # that check what we have in the DB. The reason is that
#   # you should test one thing at a time, whereas
#   # by mixing the two we're testing both
#   # the business logic and the views.
#   #
#   # However, let's not worry about this yet
#   # to keep the example simple.

# scenario "when being a new user visiting the site" do
#     expect{ sign_up }.to change(User, :count).by(1)
#     expect(page).to have_content("Welcome, alice@example.com")
#     expect(User.first.email).to eq("alice@example.com")
#   end

#   def sign_up(email = "alice@example.com",
#               password = "oranges!")
#     visit '/users/new'
#     expect(page.status_code).to eq(200)
#     fill_in :email, :with => email
#     fill_in :password, :with => password
#     click_button "Sign up"
#   end
# end

require 'spec_helper'
require './app/models/user'

feature "User signs up" do

  scenario "when a new user visits the side" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, test@test.com. Your username is dale")
    expect(User.first.email).to eq("test@test.com")
    expect(User.first.username).to eq("dale")
  end

  def sign_up(email = "test@test.com", username = "dale", password = "pear")
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, :with => email
    fill_in :username, :with => username
    fill_in :password, :with => password
    click_button "Sign up"
  end
end