require "rails_helper"

  RSpec.feature "Users Sign Up" do
    scenario "with valid credentials" do

    visit "/"
    click_link "Sign Up"
    
    fill_in "First Name", with: "John"
    fill_in "Last Name", with: "Doe"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content("You have signed up successfully.")
    expect(page).to have_content("John Doe")
  end
end

