require 'rails_helper'

describe 'User log in' do
  before :each do
      @user = User.create!(name: "bob", email: "bob@gmail.com", password: "password123")
      visit new_session_path
    end

  it "should be able to log in" do

    expect(page).to have_content("User Log In")

    fill_in :email, with: 'bob@gmail.com'
    fill_in :password, with: 'password123'


    click_button 'Log In'

    expect(current_path).to eq user_path(User.last.id)
  end

  it "must have valid email" do

    visit new_session_path

    expect(page).to have_content("User Log In")

    fill_in :email, with: 'Dave@email.com'
    fill_in :password, with: 'password123'


    click_button 'Log In'
# save_and_open_page
    expect(current_path).to eq sessions_path
    expect(page).to have_content("Sorry, your credentials are bad.")

  end

  it "must have a valid pasword" do

    visit new_session_path

    expect(page).to have_content("User Log In")

    fill_in :email, with: 'bob@gmail.com'
    fill_in :password, with: 'password456'


    click_button 'Log In'

    expect(current_path).to eq sessions_path
    expect(page).to have_content("Sorry, your credentials are bad.")

  end
end
