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

end
