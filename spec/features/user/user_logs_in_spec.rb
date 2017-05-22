require 'rails_helper'

describe "user logs in" do
  context "enters correct information" do
    it "gets rerouted to links index page" do
      user_one = User.create(email:"sample@google.com", password:"password")

      visit ("/login")

      fill_in "session[email]", with: "sample@google.com"
      fill_in "session[password]", with: "password"
      click_on("Submit")
      expect(current_path).to eq('/')
      expect(page).to have_content("Successfully logged in")
      expect(page).to have_content("Sign Out")
    end

    it "enters incorrect information" do
      user_one = User.create(email:"sample@google.com", password:"password")

      visit ("/login")

      fill_in "session[email]", with: "wrong@google.com"
      fill_in "session[password]", with: "password"
      click_on("Submit")

      expect(current_path).to eq('/login')
      expect(page).to have_content("Sorry, incorrect entry, try again.")
    end
  end
end