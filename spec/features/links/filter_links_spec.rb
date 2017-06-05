require 'rails_helper'

describe "user can filter url's by title and url", :type => :feature, :js => :true do
  it "shows filtered urls" do 
    user= User.create(email:"sample@google.com", password:"password")
    link = user.links.create(url:"https://turing.io", title:"Turing")
    link = user.links.create(url:"https://espn.com", title:"sports")    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit("/")
    
    fill_in "link-filter", with: "Turing"

    expect(page).to have_content("Turing")
    expect(page).to have_content("https://turing.io")
    expect(page).to_not have_content("sports")
    expect(page).to_not have_content("https://espn.com")
  end
end
    