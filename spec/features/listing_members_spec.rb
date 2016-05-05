# require 'rails_helper'

# RSpec.feature "Listing Members" do
#   before do
#     @john = User.create(first_name: "John", last_name: "Doe", email: "johndoe@example.com", password: "password")
#     @tess = User.create(first_name: "Tess", last_name: "Doe", email: "tessdoe@example.com", password: "password")
#   end
  
#   scenario "shows list of registered users" do
#     visit "/"
#     expect(page).to have_content("All Members")
#     expect(page).to have_content(@john.full_name)
#     expect(page).to have_content(@tess.full_name)
#   end
# end