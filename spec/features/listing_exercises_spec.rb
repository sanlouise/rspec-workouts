require 'rails_helper'

RSpec.feature "Listing Exercises" do
  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
    @tess = User.create(first_name: "Tess", last_name: "Doe", email: "tess@example.com", password: "password")
    login_as(@john)
    
    @e1 = @john.exercises.create(duration_in_min: 20, workout: "Running", workout_date: Date.today)
    @e2 = @john.exercises.create(duration_in_min: 60, workout: "Cycling", workout_date: Date.today)
    
    # Creates entry in the friendships table
    @following = Friendship.create(user: @john, friend: @tess)
  
  end
  
  scenario "shows workouts of past 14 days" do
    visit "/"
    click_link "My Lounge"
    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)
    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)
  end
  
  scenario "shows memers user follows" do
    visit "/"
    click_link "My Lounge"
    expect(page).to have_content("Members I Follow")
    expect(page).to have_link(@tess.full_name)
    expect(page).to have_content(@Unfollow)

  end
end