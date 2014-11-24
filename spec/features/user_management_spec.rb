require 'spec_helper'
require './app/models/user'

feature "User signs up" do

  scenario "when a new user visits the site" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, test@test.com. Your username is dale")
    expect(User.first.email).to eq("test@test.com")
    expect(User.first.username).to eq("dale")
  end

  scenario "with a password that doesn't match" do
    expect{ sign_up('a@a.com', 'pass', 'wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content("Sorry, your passwords don't match")
  end

  def sign_up(email = "test@test.com", username = "dale", password = "pear", password_confirmation = "pear")
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, :with => email
    fill_in :username, :with => username
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign up"

    # This test expects the website to stay at /users, instead of navigating to the home page (note the use of the current_path helper, provided by capybara). The reason is that we are submitting the form to /users and we don't want the redirection to happen if the user is not saved because we will lose the unsaved data.
  end
end