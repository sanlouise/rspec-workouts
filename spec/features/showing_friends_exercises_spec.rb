require "rails_helper"

RSpec.feature "Showing Friend Workout" do

  before do
    @john = User.create(first_name: "John", last_name: "Smith", email: "john@example.com", password: "password")
    @tess = User.create(first_name: "Tess", last_name: "Doe", email: "tess@example.com", password: "password")

    @e1 = @john.exercises.create(duration_in_min: 70, workout: "Cycling",
    workout_date: Date.today)
    @e2 = @tess.exercises.create(duration_in_min: 30, workout: "Running",
    workout_date: Date.today)
    login_as(@john)
    @following = Friendship.create(user: @john, friend: @tess)
  end

  scenario "shows workout of friends of last 14 days" do

  visit "/"
  click_link "My Lounge"
  click_link @tess.full_name
  expect(page).to have_content(@tess.full_name + "'s Workouts")
  expect(page).to have_content(@e2.workout)
  end
end