require 'rails_helper'

describe "registered user visits index page", :type => :feature, :js => true do
  it "adds new link" do
    user= User.create(email:"sample@google.com", password:"password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit("/")

      expect(page).to have_content("Url")
      expect(page).to have_content("Title")
      expect(page).to have_button("Add Link")

      fill_in "link[url]", with: "https://www.google.com/"
      fill_in "link[title]", with: "Google"
      click_on("Add Link")

      expect(current_path).to eq('/')
      expect(page).to have_content("google.com")
      expect(page).to have_content("Google")
      expect(page).to have_content("false")
    end
  end
