require "rails_helper"

describe "can mark links as unread", :type => :feature, :js => :true do
  it "Mark a link as Unread" do
    user= User.create(email:"sample@google.com", password:"password")
    link = user.links.create(url:"https://turing.io", title:"Turing", read:1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit("/")
    within('.link .read-status') do
      expect(page).to have_text("true")
    end

    click_on "Mark as Unread"

    within('.link .read-status') do
      expect(page).to have_text("false")
    end
  end
end