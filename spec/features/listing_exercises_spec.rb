require 'rails_helper'

RSpec.feature "Listing Exercises" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
    
    @e1 = @john.exercises.create(duration_in_min: 20, workout: "Running", workout_date: "2016-02-07")
    @e2 = @john.exercises.create(duration_in_min: 60, workout: "Cycling", workout_date: "2016-03-07")
  end
  
  scenario "shows workouts of past 7 days" do
    visit "/"
    click_link "My Lounge"
    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)
    expect(page).to have_content(@e1.workout)
  end
end