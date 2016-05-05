require 'rails_helper'

RSpec.feature "Follow friends" do
  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
    @tess = User.create(first_name: "Tess", last_name: "Doe", email: "tess@example.com", password: "password")
    
    login_as(@john)  
  end
  
  scenario "if signed in succeeds" do
    visit "/"
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@tess.full_name)
    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@john.id}")
    
    link = "a[href='/friendships?friend_id=#{@tess.id}']"
    find(link).click
    # Once John follows Tess, the link should have disappeared
    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@tess.id}")
  
  end
  
end