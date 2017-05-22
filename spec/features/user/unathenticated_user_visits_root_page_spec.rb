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
    it "user gets taken to sign up page and creates account" do
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

    it "user enters taken email information" do
      user_one = User.create(email:"sample@google.com", password:"password")

      visit("/users/new")

      fill_in "user[email]", with: "sample@google.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"

      click_on("Create Account")

      expect(current_path).to eq("/users")
      expect(page).to have_content("Email has already been taken")
    end
  end
end