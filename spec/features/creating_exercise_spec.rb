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
    
    fill_in "Duration", with: 30
    fill_in "Workout Details", with: "Running"
    fill_in "Date", with: "2016-04-30"
    click_button "Create Exercise"
    
    expect(page).to have_content("Your workout was added!")
    
    # The user should be redirected to the show page of the workout that was added last.
    exercise = Exercise.last 
    # Nested route, user and exercise are needed to get to the right route
    expect(page.current_path).to eq(user_exercise_path(@john, exercise))
    
  end
  
  scenario "with invalid inputs" do
    visit '/'
    click_link "My Lounge"
    click_link "New Workout"
    expect(page).to have_link("Back")
    
    fill_in "Duration", with: nil
    fill_in "Workout Details", with: ""
    fill_in "Date", with: ""
    click_button "Create Exercise"
    
    expect(page).to have_content("Oops, your workout could not be added..")
    expect_page.to have_content("Duration in min can't be blank")
    expect_page.to have_content("Duration in min is not a number")
    expect_page.to have_content("Workout can't be blank")
    expect_page.to have_content("Workout date can't be blank")
    
  end
end