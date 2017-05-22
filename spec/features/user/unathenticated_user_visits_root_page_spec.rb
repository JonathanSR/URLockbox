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
end