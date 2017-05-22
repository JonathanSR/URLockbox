require 'rails_helper'

describe "unathenticated user" do
  context "visits root page" do
    it "gets redirected to login/create page" do
      
      visit root_path

      expect(current_path).to eq("/login")
      expect(page).to have_button("Submit")
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      expect(page).to have_content("Don't have an account?")
      expect(page).to have_link("Sign Up by clicking here")
    end
  end

  context "user clicks sign up" do
    it "user gets taken to sign up page" do
      visit login_path

      click_on("Sign Up by clicking here")

      expect(current_path).to eq("/users/new")

      fill_in "user[email]", with: "sample@google.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"

      expect { click_on "Create Account"}.to change(User, :count).by(1)

      expect(current_path).to eq("/")
      expect(page).to have_content("Successfully created account")
    end
  end
end