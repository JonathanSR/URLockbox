describe "user logs out" do
  it "gets rerouted to log in page" do
    user_one = User.create(email:"sample@google.com", password:"password")

    visit ("/")
  
    fill_in "session[email]", with: "sample@google.com"
    fill_in "session[password]", with: "password"
    click_on("Submit")
    click_on("Sign Out")
    
    expect(current_path).to eq('/login')
    expect(page).to have_content("Login")
    expect(page).to have_content("Don't have an account? Sign Up by clicking here")
  end
end