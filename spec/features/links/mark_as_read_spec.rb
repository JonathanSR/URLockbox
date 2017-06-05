require "rails_helper"

describe "can mark links as read", :type => :feature, :js => :true do
  it "Mark a link as read" do
    user= User.create(email:"sample@google.com", password:"password")
    link = user.links.create(url:"https://turing.io", title:"Turing")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit("/")
    within('.link .read-status') do
      expect(page).to have_text("false")
    end

    click_on "Mark as Read"

    within('.link .read-status') do
      expect(page).to have_text("true")
    end

  end
end
