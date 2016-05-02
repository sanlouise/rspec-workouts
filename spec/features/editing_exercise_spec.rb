require "rails_helper"

RSpec.feature "Editing Exercises" do
  before do
    @owner = User.create(email: "owner@example.com", password: "password")
    @owner_ex = @owner.exercises.create!(duration_in_min: 45, workout: "Running", 
                                        workout_date: "2016-02-12")
    login_as(@owner)
  end
  
  scenario "with valid inputs succeeeds" do
    visit "/"
    click_link "My Lounge"
    link = "a[href=/users/#{@owner.id}/exercises/#{owner_ex.id}/edit]"
    find(link).click
    fill_in "Duration", with: 30
    click_button "Update Exercise"
    
    expect(page).to have_content("Your workout has been updated!")
    expect(page).to have_content(30)
    expect(page).not_to have_content(45)
  end
end