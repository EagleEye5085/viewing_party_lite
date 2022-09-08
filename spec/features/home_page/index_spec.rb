require 'rails_helper'

RSpec.describe 'home page index' do
  before :each do
    @user1 = User.create!(name: 'tom', email: 'tom.gmail.com', password: "password123")
    @user2 = User.create!(name: 'wes', email: 'wes.gmail.com', password: "password123")

    visit root_path
  end

  it 'shows the application title' do
    expect(page).to have_content('Viewing Party Lite')
  end

  it 'has a button to create a new user' do
    expect(page).to have_button('Create New User')
  end

  it 'has a button to log in' do
    expect(page).to have_button('Log In')
  end

  it 'has a link to the home page' do
    expect(page).to have_link("Home")
  end

  it 'lists all users and whitch links to the users dashboard only when a user is logged in' do
    expect(page).to_not have_link("tom.gmail.com")
    expect(page).to_not have_link("wes.gmail.com")

    user = User.create!(name: "bob", email: "bob@gmail.com", password: "password123")
    visit new_session_path

    expect(page).to have_content("User Log In")

    fill_in :email, with: 'bob@gmail.com'
    fill_in :password, with: 'password123'

    click_button 'Log In'

    expect(current_path).to eq user_path(User.last.id)

    click_link "Home"

    expect(page).to have_content("tom.gmail.com")
    expect(page).to have_content("wes.gmail.com")
  end
  
end
