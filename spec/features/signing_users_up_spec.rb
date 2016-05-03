require "rails_helper"
RSpec.feature "Users Sign Up" do
  
  scenario "with valid credentials" do
    visit "/"
    click_link "Sign Up"
    
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

  end
  
  scenario "with invalid credentials" do
    visit "/"
    click_link "Sign Up"
    
    fill_in "First name", with: ""
    fill_in "Last name", with: ""
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

  end
end

