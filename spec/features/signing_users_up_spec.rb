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
    expect(page).to have_content("Welcome! You have signed up successfully.")
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
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
  end
end

