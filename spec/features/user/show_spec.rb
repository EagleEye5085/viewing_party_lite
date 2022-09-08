require 'rails_helper'

describe 'User show page' do
  it "shows user data" do

    user = User.create!(name: "bob", email: "bob@gmail.com", password: "password123")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user.id)

    expect(page).to have_content("bob")
    expect(page).to have_button("Discover Movies")
    expect(page).to have_content("Viewing Parties")

  end

  it 'can not be viewed if not logged in' do
    user1 = User.create!(name: 'tom', email: 'tom.gmail.com', password: "password123")
    user2 = User.create!(name: 'wes', email: 'wes.gmail.com', password: "password123")

    visit user_path(user1.id)

    expect(current_path).to eq root_path
    expect(page).to have_content("Sorry, you must be logged in.")
  end

end
