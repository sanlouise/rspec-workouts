require "rails_helper"

RSpec.feature "Creating Exercise" do
    
  before do
    @john = User.create!(email: "john@example.com", password: "password")
    login_as(@john)
  end
  
  scenario "with valid inputs" do
    
    visit "/"
    click_link "My Lounge"
    click_link "New Workout"
    expect(page).to have_link("Back")
    
    
  end
end