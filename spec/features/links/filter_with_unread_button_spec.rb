require 'rails_helper'

describe "user can filter url's with unread button ", :type => :feature, :js => :true do
  it "shows unread urls" do 
    user= User.create(email:"sample@google.com", password:"password")
    link = user.links.create(url:"https://turing.io", title:"Turing", read:1)
    link = user.links.create(url:"https://espn.com", title:"sports")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit("/")
    
    click_on "Show Unread"

    expect(page).to_not have_content("Turing")
    expect(page).to_not have_content("https://turing.io")
    expect(page).to have_content("sports")
    expect(page).to have_content("https://espn.com")
  end
end