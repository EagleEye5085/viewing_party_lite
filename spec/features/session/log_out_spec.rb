require 'rails_helper'

describe 'User log out' do

  it "should be able to log out" do
    @user = User.create!(name: "bob", email: "bob@gmail.com", password: "password123")
    visit new_session_path

    expect(page).to have_content("User Log In")

    fill_in :email, with: 'bob@gmail.com'
    fill_in :password, with: 'password123'

    click_button 'Log In'

    expect(current_path).to eq user_path(User.last.id)

    click_link "Home"

    expect(current_path).to eq root_path

    expect(page).to have_button('Log Out')
    expect(page).to_not have_button('Log In')

    click_button 'Log Out'

    expect(current_path).to eq root_path

    expect(page).to_not have_button('Log Out')
    expect(page).to have_button('Log In')
  end

end
