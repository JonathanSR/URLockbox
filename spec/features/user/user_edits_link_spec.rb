require 'rails_helper'

describe "user edits link" do
  it "can edit title and url" do
    user= User.create(email:"sample@google.com", password:"password")
    link = user.links.create(url:"https://www.google.com", title:"Google")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit("/")

    click_on("Edit")
    expect(current_path).to eq("/links/#{link.id}/edit")

    fill_in "link[url]", with: "https://www.espn.com"
    fill_in "link[title]", with: "Sports"
    click_on("Edit Link")

    expect(current_path).to eq("/")
    expect(page).to have_content("espn.com")
    expect(page).to have_content("Sports")
    expect(page).to have_content("link successfully edited.")
  end
end
