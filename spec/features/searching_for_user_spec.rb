require 'rails_helper'

RSpec.feature "Searching Member" do
  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "johndoe@example.com", password: "password")
    @tess = User.create(first_name: "Tess", last_name: "Doe", email: "tessdoe@example.com", password: "password")
  end
  
  scenario "with existing name, return users" do
  
    visit "/"
    fill_in "search_name", with: "Doe"
    click_button "Search"
    
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@tess.full_name)
    
    expect(current_path).to eq("/dashboard/search")
  end
  
end