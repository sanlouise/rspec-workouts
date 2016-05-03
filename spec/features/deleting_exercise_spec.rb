require "rails_helper"

RSpec.feature "Deleting Exercises" do
  before do
    @owner = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
    # Set a date here that is within the last 14 days
    @owner_ex = @owner.exercises.create!(duration_in_min: 45, workout: "Running", 
                                        workout_date: Date.today)
    login_as(@owner)
  end
  
  scenario do
    visit "/"
    click_link "My Lounge"
    link = "//a[contains(@href, '/users/#{@owner.id}/exercises/#{@owner_ex.id}') and .//text()='Destroy']"
    find(:xpath, link).click
    
    expect(page).to have_content("Your workout was deleted!")
  end
end